//
//  CityOverViewModel.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 20/10/23.
//

import Foundation
import Combine

final class CityOverViewModel: ObservableObject {
    
    private var cityName: String = "Gurgaon"
    private var cancellable = Set<AnyCancellable>()
    @Published var weatherData: WeatherData?
    @Published var iconURL: URL = URL(string: "https://openweathermap.org/img/wn/10d@2x.png")!
    @Published var desc: String = ""
    @Published var currentTemp: Int = 0
    @Published var humidity = ""
    @Published var wind = ""
    @Published var visibility = ""
    @Published var pressure = ""
    
    var currentList: WeatherList? {
        weatherData?.list.first
    }
    
    var icon: String {
        currentList?.weather.first?.icon ?? "https://openweathermap.org/img/wn/10d@2x.png"
    }

    func getWeatherData(cityName: String) {
        WeatherService.getWeatherData(city: cityName)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    return
                }
                
            }, receiveValue: { [weak self] data in
                guard let self = self else {
                    return
                }
                DispatchQueue.main.async {
                    self.weatherData = data
                    self.iconURL = URL(string: "https://openweathermap.org/img/wn/\(self.icon)@2x.png")!
                    self.desc = self.currentList?.weather.first?.description.capitalized ?? ""
                    self.currentTemp = Int(self.currentList?.main.temp ?? 0)
                    self.humidity = "\(self.currentList?.main.humidity ?? 0)%"
                    self.wind = "\(Int(self.currentList?.wind.speed ?? 0)) Km/h"
                    self.visibility = "\((self.currentList?.visibility ?? 0)/1000) Km"
                    self.pressure = "\(self.currentList?.main.pressure ?? 0)"
                }
            })
            .store(in: &cancellable)
    }
}

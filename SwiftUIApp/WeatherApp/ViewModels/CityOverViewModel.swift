//
//  CityOverViewModel.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 20/10/23.
//

import Foundation
import Combine

final class CityOverViewModel: ObservableObject {
    
    private var cancellable = Set<AnyCancellable>()
    @Published var weatherData: WeatherData?
    @Published var isLoaded = false
    @Published var iconURL: URL = URL(string: AppConstants.defaultWeatherImage)!
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
        currentList?.weather.first?.icon ?? "10d"
    }
    
    var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter
    }
    
    // For Home
    var homeDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMM"
        return formatter
    }
    
    // For next 5 days
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "E,dd MMM"
        return formatter
    }
    
    var serverDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        return formatter
    }
    
    var currentTime: String {
        return timeFormatter.string(from: Date())
    }
    
    var currentDate: String {
        return homeDateFormatter.string(from: Date())
    }
    
    var dailyForecast: [WeatherList]? {
        return weatherData?.list.enumerated().filter { ($0.offset % 8 == 0) }.map { $0.element }
    }
    
    var latLong: (Double, Double) {
        return (weatherData?.city.coord.lat ?? 0, weatherData?.city.coord.lon ?? 0)
    }
    
    func formattedTime(from dateStr: String) -> String {
        guard let date = serverDateFormatter.date(from: dateStr) else { return "" }
        return timeFormatter.string(from: date)
    }
    
    func formattedDate(from dateStr: String) -> (day: String, date: String) {
        guard let date = serverDateFormatter.date(from: dateStr) else { return ("", "") }
        let formattedDate = dateFormatter.string(from: date).split(separator: ",").map { "\($0)" }
        return (formattedDate.first ?? "", formattedDate.last ?? "")
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
                self.isLoaded = true
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

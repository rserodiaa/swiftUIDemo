//
//  PollutionViewModel.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 30/10/23.
//

import Foundation
import Combine

class PollutionViewModel: ObservableObject {
    private var cancellable = Set<AnyCancellable>()
    @Published var pollutionData: PollutionData?
    @Published var isLoaded = false
    @Published var pollutionDetails: PollutionDetails?
    
    var aqiLevel: Int {
        pollutionData?.data.current.pollution.aqius ?? 0
    }
    
    func getPollutionData(lat: Double, lon: Double) {
        WeatherService.getPollutionData(lat: lat, lon: lon)
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
                    self.isLoaded = true
                    self.pollutionData = data
                }
            })
            .store(in: &cancellable)
    }
    
    func getPollutionDetails(lat: Double, lon: Double) {
        WeatherService.getPollutionDetails(lat: lat, lon: lon)
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
                    self.isLoaded = true
                    self.pollutionDetails = data
                }
            })
            .store(in: &cancellable)
    }
}

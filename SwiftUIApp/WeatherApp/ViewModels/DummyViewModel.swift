//
//  WeatherViewModel.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 18/10/23.
//

import SwiftUI

final class DummyViewModel: ObservableObject {
    @Published var cities = [DummyCity]()
    @Published var addCity = ""
    @Published var shouldShake = false
    
    init() {
        cities = DummyCity.populateCites
    }
    
    func addNewCity() -> Bool {
        if addCity.count < 3 {
            shouldShake.toggle()
            return false
        }
        cities.append(DummyCity(cityName: addCity, imageName: "FreezingDrizzle"))
        addCity = ""
        return true
    }
    
    func deleteCity(city: String) {
        cities = cities.filter { $0.cityName != city }
    }
}

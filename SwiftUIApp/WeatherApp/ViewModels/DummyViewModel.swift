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
    
    init() {
        cities = DummyCity.populateCites
    }
    
    func addNewCity() {
        cities.append(DummyCity(cityName: addCity, imageName: "FreezingDrizzle"))
    }
    
    func deleteCity(city: String) {
        cities = cities.filter { $0.cityName != city }
    }
}

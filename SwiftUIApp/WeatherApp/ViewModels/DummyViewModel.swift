//
//  WeatherViewModel.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 18/10/23.
//

import SwiftUI

final class DummyViewModel: ObservableObject {
    @Published var cities = [DummyCity]()
    
    init() {
        cities = DummyCity.populateCites
    }
}

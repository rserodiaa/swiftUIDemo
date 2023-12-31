//
//  CityModel.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 18/10/23.
//

import Foundation

struct DummyCity: Identifiable {
    var id = UUID()
    var cityName: String
    var imageName: String
    
    static var populateCites: [DummyCity] {
        AppConstants.dummyCity
    }
}

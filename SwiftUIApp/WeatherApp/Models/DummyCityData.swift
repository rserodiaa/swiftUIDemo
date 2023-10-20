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
    var lat: Double
    var long: Double
    var imageName: String
    
    static var populateCites: [DummyCity] {
        [
            (DummyCity(cityName: "Gurugram", lat: 0, long: 0, imageName: "CloudRainThunder")),
            (DummyCity(cityName: "Rishikesh", lat: 0, long: 0, imageName: "FreezingDrizzle")),
            (DummyCity(cityName: "Paris", lat: 0, long: 0, imageName: "Sunny")),
            (DummyCity(cityName: "London", lat: 0, long: 0, imageName: "Sunny"))
        ]
    }
}

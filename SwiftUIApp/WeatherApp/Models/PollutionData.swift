//
//  PollutionData.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 30/10/23.
//

import Foundation

// MARK: - PollutionData
struct PollutionData: Codable {
    let status: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let city, state, country: String
    let location: Location
    let current: Current
}

// MARK: - Current
struct Current: Codable {
    let pollution: Pollution
}

// MARK: - Pollution
struct Pollution: Codable {
    let ts: String
    let aqius: Int
    let mainus: String
    let aqicn: Int
    let maincn: String
}

// MARK: - Location
struct Location: Codable {
    let type: String
    let coordinates: [Double]
}

enum PollutionLevels: String {
    case Good, Moderate, Sensitive, Unhealthy, Hazardous
}

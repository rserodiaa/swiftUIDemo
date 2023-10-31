//
//  PollutionDataV2.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 30/10/23.
//

import Foundation

// MARK: - PollutionDetails
struct PollutionDetails: Codable {
    let coord: Coord
    let list: [PList]
}

// MARK: - List
struct PList: Codable {
    let main: Main
    let components: [String: Double]
    let dt: Int
}

// MARK: - Main
struct Main: Codable {
    let aqi: Int
}

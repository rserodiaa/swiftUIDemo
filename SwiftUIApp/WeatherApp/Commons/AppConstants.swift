//
//  AppConstants.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 20/10/23.
//

import Foundation

enum AppConstants{
    //Weather API Key
    static let apiKey = "bbd31ea31566748bf30c141164d48c60"
    //Air Visual API Key
    static let airVisualKey = "8d34fe9b-fd10-4175-8555-6fa486c6383e"
    
    static let defaultWeatherImage = "https://openweathermap.org/img/wn/10d@2x.png"

    enum PollutionLevels: String {
        case Good, Moderate, Sensitive, Unhealthy, Hazardous
    }
    
    static func getPollutionLevel(aqi: Int) -> (PollutionLevels, UInt, String) {
        switch aqi {
        case 0...50 : return (PollutionLevels.Good, 0xa8e05f, "happy") // Green
        case 51...100: return (PollutionLevels.Moderate, 0xfdd64b, "moderate") // Yellow
        case 101...150: return (PollutionLevels.Sensitive, 0xff9b57, "unhealthy") // Orange
        case 151...200: return (PollutionLevels.Unhealthy, 0xfe6a69, "mask") // Red
        default: return (PollutionLevels.Hazardous, 0xa97abc, "hazardous") // Purple
        }
    }
}

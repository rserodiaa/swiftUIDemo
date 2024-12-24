//
//  WeatherService.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 20/10/23.
//

import Foundation
import Combine

struct WeatherService {
    
    /// To get weather data for city
    /// - Parameter city: String
    /// - Returns: Returns publisher and decode into model ``WeatherData``
    static func getWeatherData(city: String) -> AnyPublisher<WeatherData, Error> {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(AppConstants.apiKey)&units=metric")
        else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: WeatherData.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    static func getPollutionData(lat: Double, lon: Double) -> AnyPublisher<PollutionData, Error> {
        guard let url = URL(string: "https://api.airvisual.com/v2/nearest_city?lat=\(lat)&lon=\(lon)&key=\(AppConstants.airVisualKey)")
        else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: PollutionData.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    static func getPollutionDetails(lat: Double, lon: Double) -> AnyPublisher<PollutionDetails, Error> {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/air_pollution?lat=\(lat)&lon=\(lon)&appid=\(AppConstants.apiKey)")
        else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: PollutionDetails.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

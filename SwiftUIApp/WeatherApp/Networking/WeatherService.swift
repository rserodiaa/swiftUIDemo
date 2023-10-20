//
//  WeatherService.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 20/10/23.
//

import Foundation
import Combine

struct WeatherService {
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
}

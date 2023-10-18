//
//  ApiService.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 13/10/23.
//

import Foundation
import Combine

class ApiService {
    static let shared = ApiService()
    
    private init(){}
    
    func getUsers(perPage: Int = 30, sinceId: Int? = nil) -> AnyPublisher<[User], Error> {
        var components = URLComponents(string: "https://api.github.com/users")
        components?.queryItems = [
            URLQueryItem(name: "per_page", value: "\(perPage)"),
            URLQueryItem(name: "since", value: "\(sinceId ?? 0)")
        ]
        guard let components = components, let url = components.url else {
            return Fail(error: NSError(domain: "Missing Feed component or URL", code: -10001, userInfo: nil)).eraseToAnyPublisher()
        }
        let request = URLRequest(url: url, timeoutInterval: 30)
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}


//
//  User.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 13/10/23.
//

import Foundation

struct User: Decodable {
    let id: Int
    let name: String
    let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "login"
        case avatarUrl = "avatar_url"
    }
}

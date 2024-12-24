//
//  SwiftUIAppApp.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 15/09/23.
//

import SwiftUI
import TipKit

@main
@available(iOS 17.0, *)
struct SwiftUIAppApp: App {
    var body: some Scene {
        WindowGroup {
            WeatherHome()
                .task {
                    try? Tips.resetDatastore()
                    try? Tips.configure([
                        .datastoreLocation(.applicationDefault)
                    ])
                }
        }
    }
}

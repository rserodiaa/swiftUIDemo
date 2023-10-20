//
//  WeatherHome.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 18/10/23.
//

import SwiftUI

struct WeatherHome: View {
    @ObservedObject var viewModel = DummyViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.purple.opacity(0.2).ignoresSafeArea()
                
                TabView {
                    ForEach(viewModel.cities) { city in
                        CityOverview(city: city.cityName, time: "11:00", weatherImage: city.imageName)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .navigationBarHidden(true)
            }
        }
    }
}

struct WeatherHome_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHome()
    }
}

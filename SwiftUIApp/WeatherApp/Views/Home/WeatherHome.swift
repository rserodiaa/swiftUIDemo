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
                TabView {
                    ForEach(viewModel.cities) { city in
                        CityOverview(city: city.cityName,
                                     weatherImage: city.imageName)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))

                .navigationBarItems(
                      trailing: Button(action: {}, label: {
                          NavigationLink(destination: AllCitiesList(viewModel: viewModel)) {
                             Image(systemName: "plus").foregroundColor(.black)
                         }
                      }))
            }
            .background(LinearGradient(colors: [Color(hex: 0xCF9FFF), Color(hex: 0xE0B0FF), Color(hex: 0xE6E6FA), .white], startPoint: .top, endPoint: .bottom)).ignoresSafeArea()
        }
        
    }
}

struct WeatherHome_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHome()
    }
}

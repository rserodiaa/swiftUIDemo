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
                        CityOverview(city: city.cityName)
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
            .addLinearGradient().ignoresSafeArea()
        }
        
    }
}

struct WeatherHome_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHome()
    }
}

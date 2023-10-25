//
//  CityOverview.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 18/10/23.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct CityOverview: View {
    var city: String
    var weatherImage: String
    @ObservedObject var cityViewModel = CityOverViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            
            if cityViewModel.isLoaded {
                header
                currentWeather
                weatherAttributes
                dailyForcastRow
                Spacer()
            } else {
                ProgressView()
            }
            
        }.onAppear(perform: fetchWeather)
    }
    
    private func fetchWeather() {
        cityViewModel.getWeatherData(cityName: city)
    }
    
    private var header: some View {
        VStack {
            Text(city).fontWeight(.semibold).font(.title)
            Text(cityViewModel.currentTime).font(.title3)
        }.foregroundColor(.white)
    }
    
    private var currentWeather: some View {
        VStack(alignment: .center) {
            
            WebImage(url: cityViewModel.iconURL)
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 130)
            Text("\(cityViewModel.currentTemp)° C")
                .fontWeight(.bold)
                .font(.system(size: 64))
            Text(cityViewModel.desc).font(.caption)
        }
        .foregroundColor(.white)
        .frame(width: 250, height: 260)
        .background(
            RoundedRectangle(cornerRadius: 50)
                .fill(.purple).shadow(radius: 5)
        )
        .overlay(
            Text(cityViewModel.currentDate)
                .padding(.vertical, 5)
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .fill((.white))
                )
                .offset(y: -12),
            alignment: .top
        )
    }
    
    private var weatherAttributes: some View {
        HStack(spacing: 10) {

            ValueDescriptionView(imageName: "humidity", value: $cityViewModel.humidity, weatherAttr: "Humidity")
            ValueDescriptionView(imageName: "wind", value: $cityViewModel.wind, weatherAttr: "Wind")
            ValueDescriptionView(imageName: "viewer", value: $cityViewModel.visibility, weatherAttr: "Visibility")
            ValueDescriptionView(imageName: "barometer", value: $cityViewModel.pressure, weatherAttr: "Pressure")
        }
        .padding()
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 40)
            .fill(Color(hex: 0xFAF9F6))
            .shadow(radius: 5))
        .padding(.horizontal, 25)
    }
    
    private var dailyForcastRow: some View {
        VStack {
            HStack {
                Text("Today")
                Spacer()
                NavigationLink(destination: AllDaysForecast()) {
                    Text("Next 7 days")
                    Image(systemName: "chevron.right")
                }
                
            }
            .fontWeight(.bold)
            .padding(.horizontal, 41)
            
            ScrollView(.horizontal) {
                HStack(spacing: 30) {
                    
                    if let weatherData = cityViewModel.weatherData {
                        ForEach(weatherData.list.prefix(5), id: \.dt) { data in
                            let icon = data.weather.first?.icon ?? "01n"
                            let iconUrl = "https://openweathermap.org/img/wn/\(icon)@2x.png"
                            HourlyBox(time: cityViewModel.formattedTime(from: data.dtTxt),
                                      iconURL: iconUrl,
                                      temp: Int(data.main.temp))
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct CityOverview_Previews: PreviewProvider {
    static var previews: some View {
        CityOverview(city: "Gurugram", weatherImage: "Sunny")
    }
}

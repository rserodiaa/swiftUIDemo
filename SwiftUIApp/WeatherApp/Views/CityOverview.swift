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
    @State var city: String
    @State var time: String
    @State var weatherImage: String
    @ObservedObject var cityViewModel = CityOverViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            
            header
            currentWeather
            weatherAttributes
            DailyForecast()
            
            Spacer()
            
        }.onAppear(perform: fetchWeather)
    }
    
    private func fetchWeather() {
        cityViewModel.getWeatherData(cityName: city)
    }
    
    private var currentTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: Date())
    }
    
    private var currentDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMM"
        return formatter.string(from: Date())
    }
    
    private var header: some View {
        VStack {
            Text(city).fontWeight(.semibold).font(.title)
            Text(currentTime).font(.title3)
        }
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
                .fill(.purple)
        )
        .overlay(
            Text(currentDate)
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
        .background(RoundedRectangle(cornerRadius: 40).fill(.white))
        .padding(.horizontal, 25)
    }
}

struct CityOverview_Previews: PreviewProvider {
    static var previews: some View {
        CityOverview(city: "Gurugram", time: "11:00AM", weatherImage: "Sunny")
    }
}

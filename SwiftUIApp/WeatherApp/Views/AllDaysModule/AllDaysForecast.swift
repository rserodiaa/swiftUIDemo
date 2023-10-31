//
//  AllDaysForecast.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 18/10/23.
//

import SwiftUI

struct AllDaysForecast: View {
    @Environment(\.presentationMode) var presentationMode
    var cityViewModel: CityOverViewModel
    @ObservedObject var pollutionVM = PollutionViewModel()
    @State private var showingPopover = false
    
    var body: some View {
        
        //MARK: Body
        ScrollView {
            navigationBar
            heading
            Spacer().frame(height: 30)
            
            dailyWidget
            Spacer().frame(height: 30)
            
            if pollutionVM.isLoaded {
                pollutionStack
            } else {
                ProgressView()
            }
            
        }
        .onAppear(perform: fetchPollutionData)
        .navigationBarHidden(true)
        .background(LinearGradient(colors: [Color(hex: 0xCF9FFF), Color(hex: 0xE0B0FF), Color(hex: 0xE6E6FA), .white], startPoint: .top, endPoint: .bottom))
    }
    
    
    //MARK: Widgets
    private var navigationBar: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                Text("Back")
                Spacer()
            }
        }
        .foregroundColor(.primary)
        .padding()
    }
    
    private var heading: some View {
        Text("\(cityViewModel.weatherData?.city.name ?? ""), \(cityViewModel.weatherData?.city.country ?? "")")
            .fontWeight(.bold)
            .font(.system(size: 30))
    }
    
    private var dailyWidget: some View {
        VStack {
            if let daily = cityViewModel.dailyForecast {
                ForEach(daily, id: \.dt) { data in
                    let date = cityViewModel.formattedDate(from: data.dtTxt)
                    let icon = data.weather.first?.icon ?? "01n"
                    let iconUrl = URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")
                    DailyRow(imageName: iconUrl,
                             temp: Int(data.main.temp),
                             day: date.day,
                             date: date.date)
                }
            }
            Spacer()
        }
        .padding()
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 40).fill(.purple.opacity(0.75)))
        .padding(.horizontal, 25)
    }
    
    private var pollutionStack: some View {
        HStack {
            Image(AppConstants.getPollutionLevel(aqi: pollutionVM.aqiLevel).2)
                .resizable()
                .frame(width: 90, height: 90)
                .clipShape(Circle())
            Spacer()
            
            VStack {
                Text("\(pollutionVM.aqiLevel)").font(.title)
                Text("US AQI").font(.caption).fontWeight(.light)
            }
            
            Text(AppConstants.getPollutionLevel(aqi: pollutionVM.aqiLevel).0.rawValue)
                .padding(.leading, 8)
                .font(.title2)
                .fontWeight(.light)
        }
        .padding()
        .padding(.vertical, 20)
        .frame(height: 130)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 30)
            .fill(Color(hex: AppConstants.getPollutionLevel(aqi: pollutionVM.aqiLevel).1))
            
            .overlay(alignment: .bottomTrailing, content: {
                Button(action: {
                    showingPopover = true
                }) {
                    Image("information")
                        .resizable()
                        .frame(width: 30,
                               height: 30)
                }
                .popover(isPresented: $showingPopover) {
                    PollutionChart()
                }
            })
        )
        .padding(.horizontal, 25)
        
    }
    
    
    private func fetchPollutionData() {
        if pollutionVM.pollutionData == nil {
            pollutionVM.getPollutionData(lat: cityViewModel.latLong.0,
                                         lon: cityViewModel.latLong.1)
        }
    }
}

struct AllDaysForecast_Previews: PreviewProvider {
    static var previews: some View {
        AllDaysForecast(cityViewModel: CityOverViewModel())
    }
}

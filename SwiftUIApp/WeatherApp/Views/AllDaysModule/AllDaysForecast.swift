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
    
    var body: some View {
        
        ScrollView {
            navigationBar
            Text("\(cityViewModel.weatherData?.city.name ?? ""), \(cityViewModel.weatherData?.city.country ?? "")")
                .fontWeight(.bold)
                .font(.system(size: 30))
            Spacer().frame(height: 30)
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
            .background(RoundedRectangle(cornerRadius: 40).fill(.purple))
            .padding(.horizontal, 25)
            
        }
        .navigationBarHidden(true)
        .background(Color.purple.opacity(0.2))
    }
    
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
}

struct AllDaysForecast_Previews: PreviewProvider {
    static var previews: some View {
        AllDaysForecast(cityViewModel: CityOverViewModel())
    }
}

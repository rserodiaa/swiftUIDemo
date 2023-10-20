//
//  DialyForecast.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 18/10/23.
//

import SwiftUI

struct DailyForecast: View {
    var body: some View {
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
                    HourlyBox()
                    HourlyBox()
                    HourlyBox()
                    HourlyBox()
                    HourlyBox()
                    HourlyBox()
                }
            }
            .padding(.horizontal, 20)
        }
    }
}


struct DailyForecast_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecast()
    }
}

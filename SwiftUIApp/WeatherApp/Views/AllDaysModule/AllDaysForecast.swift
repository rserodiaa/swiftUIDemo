//
//  AllDaysForecast.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 18/10/23.
//

import SwiftUI

struct AllDaysForecast: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ScrollView {
            navigationBar
            Text("Gurugram")
                .fontWeight(.bold)
                .font(.system(size: 30))
            Spacer().frame(height: 30)
            VStack {
                DailyRow(imageName: "HeavyRainSwrsDay", temp: 19, day: "Mon", date: "16 Oct")
                DailyRow(imageName: "Sunny", temp: 34, day: "Tue", date: "17 Oct")
                DailyRow(imageName: "Cloudy", temp: 28, day: "Wed", date: "18 Oct")
                
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
        AllDaysForecast()
    }
}

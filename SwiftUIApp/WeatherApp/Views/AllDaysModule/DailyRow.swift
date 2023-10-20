//
//  DailyRow.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 18/10/23.
//

import SwiftUI

struct DailyRow: View {
    @State var imageName: String
    @State var temp: Int
    @State var day: String
    @State var date: String
    
    var body: some View {
        HStack(spacing: 25) {
            Image(imageName)
                .resizable()
                .frame(width: 60, height: 60)
            Spacer()
            Text("\(temp)° C").font(.system(size: 27))
            
            VStack(spacing: 8) {
                Text(day)
                
                Text(date)
            }
        }
        .foregroundColor(.white)
        .fontWeight(.semibold)
        
    }
}

struct DailyRow_Previews: PreviewProvider {
    static var previews: some View {
        DailyRow(imageName: "HeavyRainSwrsDay", temp: 30, day: "Monday", date: "17 Oct")
    }
}

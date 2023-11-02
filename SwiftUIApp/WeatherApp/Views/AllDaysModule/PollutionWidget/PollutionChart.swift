//
//  PollutionChart.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 30/10/23.
//

import SwiftUI

struct PollutionChart: View {
    let levels = [0,51,101,151,201]
    let levelStr = ["0-50", "51-100", "101-150", "151-200", "200+"]
    @State private var startAnimation = false
    
    var body: some View {
        
        VStack {
            Text("Pollution Levels").font(.largeTitle)
            Text("**As per US AQI").font(.subheadline).fontWeight(.light)

                .padding(.bottom, 30)
            ForEach(Array(levels.enumerated()), id: \.offset) { (index, level) in
                HStack {
                    Image(AppConstants.getPollutionLevel(aqi: level).2)
                        .padding(.trailing, 20)
                    Text("\(levelStr[index]) AQI")
                        .fontWeight(.ultraLight)
                    
                    Spacer()
                    Text(AppConstants.getPollutionLevel(aqi: level).0.rawValue)
                        .font(.title2)
                        .fontWeight(.ultraLight)
                        .padding(.trailing, 8)
                    
                }
                .padding(15)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 40).fill(Color(hex: AppConstants.getPollutionLevel(aqi: level).1)))
                .padding(.horizontal, 30)
                .opacity(startAnimation ? 1 : 0)
                .offset(CGSize(width: 0, height: startAnimation ? -10 : 0))
                .animation(.easeIn(duration: 1.4), value: startAnimation)
                .onAppear {
                    startAnimation = true
                }
            }
            
        }
    }
}

struct PollutionChart_Previews: PreviewProvider {
    static var previews: some View {
        PollutionChart()
    }
}

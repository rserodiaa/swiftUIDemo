//
//  PollutionDetailsView.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 31/10/23.
//

import SwiftUI

struct PollutionDetailsView: View {
    var comps: [String: Double]?
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 30) {
                
                if let comps = comps {
                    ForEach(comps.sorted(by: >), id: \.key) { key, value in
                        let value = Int(value)
                        let pollutant = AppConstants.Pollutants(rawValue: key) ?? .so2
                        VStack {
                            
                        ZStack {
                            
                            Circle()
                                .stroke(lineWidth: 5)
                                .foregroundColor(Color(hex: pollutant.getColor(value: value)))
                                .padding(2)
                            Text("\(value)")
                        }
                        
                            Text(pollutant.value)
                                .font(.caption)
                    }
                        
                    }
                }
            }
        }
        .padding()
        .padding(.vertical, 10)
        .frame(height: 130)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color(hex: 0xF4F1F1))
        )
        .padding(.horizontal, 25)
    }
}

struct PollutionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PollutionDetailsView(comps: AppConstants.dummyComp)
    }
}

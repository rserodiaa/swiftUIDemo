//
//  HourlyBox.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 18/10/23.
//

import SwiftUI

struct HourlyBox: View {
    var body: some View {
        VStack {
            Text("11:00 AM")
                .font(.caption)
                .fontWeight(.semibold)
            Image(systemName: "cloud")
                .resizable()
                .frame(width: 40, height: 30)
            Text("23° C")
                .fontWeight(.bold)
                .font(.system(size: 17))
        }
        .foregroundColor(.white)
        .frame(width: 80, height: 130)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.purple)
            )
    }
}

struct HourlyBox_Previews: PreviewProvider {
    static var previews: some View {
        HourlyBox()
    }
}

//
//  ValueDescriptionView.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 18/10/23.
//

import SwiftUI

struct ValueDescriptionView: View {
    @State var imageName: String
    @Binding var value: String
    @State var weatherAttr: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 1) {
            Image(imageName)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.purple)
            Text(value).fontWeight(.semibold)
            Text(weatherAttr).foregroundColor(.gray)
        }
    }
}

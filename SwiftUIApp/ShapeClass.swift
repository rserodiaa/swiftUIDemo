//
//  ShapeClass.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 16/09/23.
//

import SwiftUI

struct ShapeClass: View {
    var body: some View {
        VStack(spacing: 150) {
            Image(systemName: "heart.fill")
                .resizable()
                .foregroundColor(Color.white)
                .frame(width: 40, height: 40)
                .background(
                    Circle()
                        .fill(
                            LinearGradient(colors: [Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)),Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))], startPoint: .leading, endPoint: .trailing))
                        .frame(width: 100, height: 100)
                        .shadow(color: Color.red.opacity(0.6), radius: 10, x: 0, y: 10)
                        .overlay(Circle().foregroundColor(Color.blue)
                            .frame(width: 35, height: 35)
                            .overlay(Text("3")
                                .foregroundColor(.white))
                                 , alignment: .bottomTrailing)
                    
            )
            HStack(alignment: .center) {
                Spacer()
                Rectangle().fill(.blue)
                    .frame(width: 50, height: 50)
                Spacer()
                Rectangle().fill(.red)
                    .frame(width: 75, height: 75)
                Spacer()
                Rectangle().fill(.green)
                    .frame(width: 100, height: 100)
                Spacer()
            }
        }
    }
}

struct ShapeClass_Previews: PreviewProvider {
    static var previews: some View {
        ShapeClass()
    }
}

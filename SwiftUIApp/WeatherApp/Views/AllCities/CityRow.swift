//
//  CityRow.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 26/10/23.
//

import SwiftUI

struct CityRow: View {
    var cityName: String
    var imageName: String
    var isEditMode: Bool
    var deletedCity: ((String) -> ())?
    
    var body: some View {
        HStack {
            Text(cityName)
                .font(.title2)
                .foregroundColor(.white)
            Spacer()
            MarqueeImageView(image: Image(imageName),
                             scrollSpeed: 0.5)
            if isEditMode {
                Button {
                    deletedCity?(cityName)
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(.white)
                }
//                Image(systemName: "minus.circle.fill")
//                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal, 20)

    }
}

struct CityRow_Previews: PreviewProvider {
    static var previews: some View {
        CityRow(cityName: "London",
                imageName: "HeavyRainSwrsDay",
                isEditMode: false, deletedCity: nil)
        .background(
            RoundedRectangle(cornerRadius: 20)
            .fill(.purple)
        )
    }
}


struct MarqueeImageView: View {
    @State private var scrollOffset: CGFloat = 0
    let image: Image
    let scrollSpeed: CGFloat

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(0..<Int(1 / scrollSpeed) + 1) { _ in
                    image
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(x: scrollOffset)
                    Spacer()
                        .frame(width: 50)
                }
            }
            .frame(alignment: .leading)
            .onAppear {
                withAnimation(Animation.linear(duration: Double(1 / scrollSpeed)).repeatForever(autoreverses: false)) {
                    self.scrollOffset = -50
                }
            }
        }
        .frame(width: 50, height: 50)
    }
}



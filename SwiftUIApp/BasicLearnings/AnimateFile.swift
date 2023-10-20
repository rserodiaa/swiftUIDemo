//
//  AnimateFile.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 17/09/23.
//

import SwiftUI

struct AnimateFile: View {
    @State var isAnimated: Bool = false
    var body: some View {
        VStack {
            Button("Press") {
                withAnimation {
                    isAnimated.toggle()
                }
                
            }
            Spacer()
            RoundedRectangle(cornerRadius: isAnimated ? 25 : 50)
                .fill(isAnimated ? .cyan : .orange)
                .frame(width: isAnimated ? 200 : 100, height: isAnimated ? 200 : 100)
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 10 : 250)
            
            Spacer()
                
        }
    }
}

struct AnimateFile_Previews: PreviewProvider {
    static var previews: some View {
        AnimateFile()
    }
}

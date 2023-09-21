//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 15/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack {
                Spacer()
                Image("playing-cards").resizable().frame(width: 120,  height: 120).aspectRatio( contentMode: .fit)
                Spacer()
                HStack {
                    Spacer()
                    Image("diamonds-7").resizable().frame(width: 140,  height: 250).aspectRatio(contentMode: .fit)
                    Spacer()
                    Image("hearts-8").resizable().frame(width: 140,  height: 250).aspectRatio(contentMode: .fit)
                    Spacer()
                }
                Spacer()
                
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.largeTitle)
                            .fontWeight(.semibold).padding(.bottom, 2.0)
                        Text("0")
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.largeTitle)
                            .fontWeight(.semibold).padding(.bottom, 2.0)
                        Text("0").font(.largeTitle)
                    }
                    Spacer()
                }
                Spacer()
            }

        }
            }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

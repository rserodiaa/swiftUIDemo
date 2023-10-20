//
//  TabView.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 19/09/23.
//

import SwiftUI

struct TabViewDemo: View {
    var body: some View {
        TabView {
            ShapeClass()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            AnimateFile()
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Settings")
                
            }
            
        }.tint(.orange)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewDemo()
    }
}

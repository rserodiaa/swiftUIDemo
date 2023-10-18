//
//  LoaderView.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 16/10/23.
//

import SwiftUI

struct LoaderView: View {
    let isFailed: Bool
    var body: some View {
        HStack {
            if !isFailed {
                ProgressView()
            }
            Text(isFailed ? "Please retry.." : "Loading...")
                .foregroundColor(isFailed ? .red : .green)
                .padding()
        }
        
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView(isFailed: true)
    }
}

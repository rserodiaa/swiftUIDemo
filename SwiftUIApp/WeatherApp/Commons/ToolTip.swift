//
//  ToolTip.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 23/12/24.
//

import Foundation
import TipKit

@available(iOS 17.0, *)
struct ToggleTip: Tip {
    var title: Text {
        Text("Tap to toggle")
    }
    
    var message: Text? {
        Text("Toggle to view particle details..")
    }
    var image: Image? {
        Image(systemName: "info.circle.fill")
    }
}


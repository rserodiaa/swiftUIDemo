//
//  SubscriberClass.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 25/09/23.
//

import SwiftUI
import Combine

class SubscriberViewModel: ObservableObject {
    @Published var count = 0
    var timer: AnyCancellable?
    
    init() {
//        SetupTimer()
    }
    func SetupTimer() {
        timer = Timer
                .publish(every: 1, on: .main, in: .common)
                .autoconnect()
                .sink { [weak self] _ in
                    self?.count += 1
                }
    }
    
}

struct SubscriberClass: View {
    
    @StateObject var vm = SubscriberViewModel()
    
    var body: some View {
        Text("\(vm.count)").font(.largeTitle)
    }
}

struct SubscriberClass_Previews: PreviewProvider {
    static var previews: some View {
        SubscriberClass()
    }
}

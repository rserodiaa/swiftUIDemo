//
//  ListViewModel.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 13/10/23.
//

import Foundation
import Combine

class ListViewModel: ObservableObject {
    
    @Published var users: [User] = []
    @Published var isRequestFailed = false
    
    private let pageLimit = 25
    private var currentLastId: Int? = nil
    private var cancellable: AnyCancellable?
    
    func getUsers() {
        cancellable = ApiService.shared.getUsers(perPage: pageLimit, sinceId: currentLastId)
            .receive(on: DispatchQueue.main)
        
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.isRequestFailed = true
                    print(error)
                case .finished:
                    print("finished")
                }
            } receiveValue: { users in
                self.users.append(contentsOf: users)
                self.currentLastId = users.last?.id
            }
    }
    
}

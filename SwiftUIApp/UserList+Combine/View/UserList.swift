//
//  UserList.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 13/10/23.
// Followed this tutorial betterprogramming.pub/build-an-infinite-list-with-swiftui-and-combine-f9ea1e83a4a7

import SwiftUI

struct UserList: View {
    
    @ObservedObject var viewModel = ListViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.users, id: \.id) { user in
                    UserRow(user: user)
                }
                
                LoaderView(isFailed: viewModel.isRequestFailed)
                    .onAppear(perform: fetchData)
                    .onTapGesture(perform: retryLoading)
            }
            .navigationTitle("Users List")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    private func fetchData() {
        viewModel.getUsers()
    }
    
    private func retryLoading() {
        if viewModel.isRequestFailed {
            viewModel.isRequestFailed = false
            fetchData()
        }
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        UserList()
    }
}

//
//  UserRow.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 13/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserRow: View {
    let user: User
    var body: some View {
        HStack(spacing: 12) {
            
//            AsyncImage(url: URL(string: user.avatarUrl),
//                       transaction: Transaction(animation: .easeIn)) { phase in
//                            switch phase {
//                            case .empty:
//                                ProgressView()
//                            case .success(let image):
//                                image
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(maxWidth: 30, maxHeight: 30)
//                                    .clipShape(Circle())
//                                    .transition(.scale(scale: 0.1, anchor: .center))
//                            case .failure:
//                                Image(systemName: "wifi.slash")
//                            @unknown default:
//                                EmptyView()
//                            }
//
//            }
            WebImage(url: URL(string: user.avatarUrl)!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 30, maxHeight: 30)
                .clipShape(Circle())
//            AsyncImage(
//                url: URL(string: user.avatarUrl),
//                content: { image in
//                    image.resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(maxWidth: 30, maxHeight: 30)
//                        .clipShape(Circle())
//                        .transition(.scale.animation(.easeInOut))
//                },
//                placeholder: {
//                    ProgressView()
//                }
//            )
            Text(user.name).font(.title)
            Spacer()
        }
        
        
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        let mockUser = User(id: 1, name: "Peter", avatarUrl: "https://avatars.githubusercontent.com/u/52?v=4")
        UserRow(user: mockUser)
    }
}

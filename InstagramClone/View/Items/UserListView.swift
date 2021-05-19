//
//  UserListView.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.users) { user in
                    NavigationLink(
                        destination: ProfileView()) {
                        UserCell(user: user)
                                .padding(.leading)
                    }
                }
            }
        }
    }
}

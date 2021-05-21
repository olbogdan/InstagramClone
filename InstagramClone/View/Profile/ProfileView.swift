//
//  ProfileView.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel

    init(user: User) {
        self.viewModel = ProfileViewModel(user: user)
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ProfileHeaderView(viewModel: viewModel)
                PostGridView(config: .profile(viewModel.user.uid))
            }
        }.padding(.top)
    }
}

//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import Kingfisher
import SwiftUI

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .background(Color(.systemBlue))
                    .clipShape(Circle())
                    .padding(.leading)

                HStack(alignment: .center) {
                    Spacer()
                    UserStatView(value: 22, title: "Posts")
                    UserStatView(value: 10040, title: "Followers")
                    UserStatView(value: 450, title: "Following")
                    Spacer()
                }
            }

            Text(viewModel.user.userName + " " + viewModel.user.fullName)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])

            Text("Back in feature expert || traveler with a time machine")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)

            HStack {
                Spacer()
                ProfileActionButtonView(viewModel: viewModel)
                Spacer()
            }.padding()
        }
    }
}

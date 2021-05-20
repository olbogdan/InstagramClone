//
//  ProfileActionButtonView.swift
//  InstagramClone
//
//  Created by bogdanov on 12.05.21.
//

import SwiftUI

struct ProfileActionButtonView: View {
    @ObservedObject var viewModel: ProfileViewModel
    var isFollowed: Bool { return viewModel.user.isFollowed == true}

    var body: some View {
        if viewModel.user.isCurrentUser {
            Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/) {
                Text("Edit Profile")
                    .foregroundColor(.black)
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 320, height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 3)
                        .stroke(Color.gray, lineWidth: 1))
            }
        } else {
            HStack {
                Spacer()
                Button(action: { isFollowed ? viewModel.unfollow() : viewModel.follow() }) {
                    Text(isFollowed ? "Following" : "Follow")
                        .foregroundColor(isFollowed ? .black : .white)
                        .font(.system(size: 14, weight: .semibold))
                        .frame(height: 32)
                        .frame(maxWidth: 172)
                        .background(isFollowed ? Color.white : Color.blue)
                        .cornerRadius(3)
                        .overlay(RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0))
                }
                Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/) {
                    Text("Message")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .semibold))
                        .frame(height: 32)
                        .frame(maxWidth: 172)
                        .overlay(RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1))
                }
                Spacer()
            }
        }
    }
}

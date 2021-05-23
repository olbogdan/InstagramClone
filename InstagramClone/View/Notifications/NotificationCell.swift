//
//  NotificationCell.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import Kingfisher
import SwiftUI

struct NotificationCell: View {
    @ObservedObject var viewModel: NotificationCellViewModel
    private var isFollowed: Bool {
        return  viewModel.notification.isFollowed == true
    }

    var body: some View {
        HStack {
            KFImage(URL(string: viewModel.notification.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())

            Text(viewModel.notification.userName).font(.system(size: 14, weight: .semibold))
                + Text(" \(viewModel.notification.type.notificationMessage)")
                .font(.system(size: 15))
            Spacer()

            if viewModel.notification.type != .follow {
                Image("img1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            } else {
                Button(action: {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }) {
                    Text(isFollowed ? "Following" : "Follow")
                        .foregroundColor(isFollowed ? .black : .white)
                        .font(.system(size: 14, weight: .semibold))
                        .frame(height: 32)
                        .frame(maxWidth: 100)
                        .background(isFollowed ? Color.white : Color.blue)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0))
                }
            }
        }.padding(.horizontal)
    }
}

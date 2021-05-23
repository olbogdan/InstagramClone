//
//  NotificationCell.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    let notification: Notification

    var body: some View {
        HStack {
            KFImage(URL(string: notification.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())

            Text(notification.userName).font(.system(size: 14, weight: .semibold))
                + Text(" \(notification.type.notificationMessage)")
                .font(.system(size: 15))
            Spacer()

            if notification.type != .follow {
                Image("img1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            } else {
                Button(action: {}) {
                    Text("Follow")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                }
            }
        }.padding(.horizontal)
    }
}

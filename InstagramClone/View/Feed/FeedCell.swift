//
//  FeedCell.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import Kingfisher
import SwiftUI

struct FeedCell: View {
    var geometryProxy: GeometryProxy
    var post: Post

    var body: some View {
        VStack(alignment: .leading) {
            // user info
            HStack {
                KFImage(URL(string: post.ownerImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)

                Text(post.ownerUserName)
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding([.leading, .bottom], 8)

            // post image
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: geometryProxy.size.width)
                .frame(maxHeight: 440)
                .clipped()

            // action buttons
            ActionButtonsView()

            // caption

            Text("\(post.likes) likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 4)

            DescriptionView(post: post)

            Text(
                post.timestamp.dateValue().timeAgo()
            )
            .font(.system(size: 14))
            .foregroundColor(.gray)
            .padding([.leading], 8)
        }
    }
}

struct ActionButtonsView: View {
    var body: some View {
        HStack(spacing: 16) {
            Button(action: {}) {
                Image(systemName: "heart")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .font(.system(size: 20))
            }
            Button(action: {}) {
                Image(systemName: "bubble.right")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .font(.system(size: 20))
            }
            Button(action: {}) {
                Image(systemName: "paperplane")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .font(.system(size: 20))
            }
        }
        .padding(.leading, 4)
        .foregroundColor(.black)
    }
}

struct DescriptionView: View {
    var post: Post

    var body: some View {
        Group {
            Text(post.ownerUserName).font(.system(size: 14, weight: .semibold))
                + Text(" \(post.caption)")
                .font(.system(size: 15))
        }.padding(.horizontal, 8)
    }
}

extension Date {
    func timeAgo() -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.year, .month, .day, .hour, .minute, .second]
        formatter.zeroFormattingBehavior = .dropAll
        formatter.maximumUnitCount = 1
        return String(format: formatter.string(from: self, to: Date()) ?? "", locale: .current)
    }
}

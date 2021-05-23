//
//  FeedCell.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import Kingfisher
import SwiftUI

struct FeedCell: View {
    @ObservedObject var viewModel: FeedCellViewModel

    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading) {
            // user info
            HStack {
                KFImage(URL(string: viewModel.post.ownerImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)

                Text(viewModel.post.ownerUserName)
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding([.leading, .bottom], 8)

            // post image
            KFImage(URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFit()
                .clipped()

            // action buttons
            ActionButtonsView(viewModel: viewModel)

            // caption

            Text(viewModel.likeString)
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 4)

            DescriptionView(post: viewModel.post)

            Text(
                viewModel.post.timestamp.dateValue().timeAgo()
            )
            .font(.system(size: 14))
            .foregroundColor(.gray)
            .padding([.leading], 8)

            Spacer()
        }
    }
}

struct ActionButtonsView: View {
    @ObservedObject var viewModel: FeedCellViewModel
    var didLike: Bool {
        return viewModel.post.didLike ?? false
    }

    var body: some View {
        HStack(spacing: 16) {
            Button(action: {
                didLike ? viewModel.unlike() : viewModel.like()
            }) {
                Image(systemName: didLike ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(didLike ? .red : .black)
                    .frame(width: 20, height: 20)
                    .font(.system(size: 20))
            }
            NavigationLink(destination: CommentsView(post: viewModel.post)) {
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

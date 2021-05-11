//
//  NotificationCell.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import SwiftUI

struct NotificationCell: View {
    @State private var showPostImage = false

    var body: some View {
        HStack {
            Image("img5")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())

            Text("doc").font(.system(size: 14, weight: .semibold))
                + Text(" liked one of your posts.")
                .font(.system(size: 15))
            Spacer()

            if showPostImage {
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

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}

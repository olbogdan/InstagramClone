//
//  UserCell.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import Kingfisher
import SwiftUI

struct UserCell: View {
    let user: User

    var body: some View {
        HStack {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())

            VStack(alignment: .leading) {
                Text(user.userName)
                    .font(.system(size: 14, weight: .semibold))
                Text(user.fullName)
                    .font(.system(size: 13))
            }
            Spacer()
        }
    }
}

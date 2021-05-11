//
//  UserCell.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            Image("img5")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())

            VStack(alignment: .leading) {
                Text("Doc")
                    .font(.system(size: 14, weight: .semibold))
                Text("Doctor Who")
                    .font(.system(size: 13))
            }
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}

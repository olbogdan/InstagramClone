//
//  CommentCell.swift
//  InstagramClone
//
//  Created by bogdanov on 22.05.21.
//

import SwiftUI

struct CommentCell: View {
    var body: some View {
        HStack {
            Image("img1")
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())

            Text("Frodo").font(.system(size: 14, weight: .semibold))
                + Text(" some test comment").font(.system(size: 14))

            Spacer()
            
            Text("2m")
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }.padding(.horizontal)
    }
}

struct CommentCell_Preview: PreviewProvider {
    static var previews: some View {
        CommentCell()
    }
}

//
//  PostGridView.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import SwiftUI

struct PostGridView: View {
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3

    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(0 ..< 10) { _ in
                Image("img1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: width)
                    .clipped()
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}

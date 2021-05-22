//
//  CommentView.swift
//  InstagramClone
//
//  Created by bogdanov on 22.05.21.
//

import SwiftUI

struct CommentView: View {
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(0 ..< 10) { _ in
                        CommentCell()
                    }
                }
            }.padding(.top)
        }
    }
}

struct CommentView_Preview: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}

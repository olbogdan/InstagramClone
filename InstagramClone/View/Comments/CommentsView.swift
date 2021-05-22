//
//  CommentsView.swift
//  InstagramClone
//
//  Created by bogdanov on 22.05.21.
//

import SwiftUI

struct CommentsView: View {
    @State var commentText = ""
    @ObservedObject var viewModel: CommentsViewModel
    
    init (post: Post) {
        self.viewModel = CommentsViewModel(post: post)
    }

    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(viewModel.comments) { comment in
                        CommentCell(comment: comment)
                    }
                }
            }.padding(.top)

            CustomInputView(inputText: $commentText, action: uploadedComment)
        }
    }

    func uploadedComment() {
        viewModel.uploadComment(commentText: commentText)
        commentText = ""
    }
}

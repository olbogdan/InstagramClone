//
//  CommentViewModel.swift
//  InstagramClone
//
//  Created by bogdanov on 22.05.21.
//

import Firebase
import SwiftUI

class CommentsViewModel: ObservableObject {
    private let post: Post

    init(post: Post) {
        self.post = post
    }

    func uploadComment(commentText: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let postId = post.id else { return }
        let data: [String: Any] = ["userName": user.userName,
                                   "profileImageUrl": user.profileImageUrl,
                                   "uid": user.uid,
                                   "timestamp": Timestamp(date: Date()),
                                   "postOwnerUid": post.ownerUid,
                                   "commentText": commentText]
        COLLECTION_POSTS.document(postId)
            .collection("post-comments")
            .addDocument(data: data) { error in
                if let error = error {
                    print("DEBUG: Error uploading comment \(error)")
                }
            }
    }

    func fetchComment() {}
}

//
//  Comment.swift
//  InstagramClone
//
//  Created by bogdanov on 22.05.21.
//

import Firebase

struct Comment: Identifiable, Decodable {
    @DocumentID var id: String?
    let userName: String
    let postOwnerUid: String
    let profileImageUrl: String
    let commentText: String
    let timestamp: Timestamp
    let uid: String
}

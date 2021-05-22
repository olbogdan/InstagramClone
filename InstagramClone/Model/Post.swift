//
//  Post.swift
//  InstagramClone
//
//  Created by bogdanov on 21.05.21.
//

import Firebase
import FirebaseFirestoreSwift

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    let imageUrl: String
    let ownerUid: String
    let ownerImageUrl: String
    let ownerUserName: String

    var didLike: Bool? = false
}

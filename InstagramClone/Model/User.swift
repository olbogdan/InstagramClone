//
//  User.swift
//  InstagramClone
//
//  Created by bogdanov on 18.05.21.
//

import FirebaseFirestoreSwift

struct User: Decodable, Identifiable {
    @DocumentID var id: String?
    let uid: String
    let userName: String
    let email: String
    let profileImageUrl: String
    let fullName: String
    var bio: String?
    var isFollowed: Bool? = false
    var stats: UserStats?

    var isCurrentUser: Bool {
        return AuthViewModel.shared.userSession?.uid == uid
    }
}

struct UserStats: Decodable {
    var following: Int = 0
    var posts: Int = 0
    var followers: Int = 0
}

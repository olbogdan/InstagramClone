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
}

//
//  Notification.swift
//  InstagramClone
//
//  Created by bogdanov on 22.05.21.
//

import Firebase
import FirebaseFirestoreSwift

struct Notification: Identifiable, Decodable {
    @DocumentID var id: String?
    var postId: String?
    let userName: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let type: NotificationType
    let uid: String

    var isFollowed: Bool? = false
    var post: Post?
    var user: User?
}

enum NotificationType: Int, Decodable {
    case like
    case comment
    case follow

    var notificationMessage: String {
        switch self {
            case .like: return " liked one of your posts."
            case .comment: return " commented on one of your posts."
            case .follow: return " started following you."
        }
    }
}

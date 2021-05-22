//
//  NotificationsViewModel.swift
//  InstagramClone
//
//  Created by bogdanov on 22.05.21.
//

import Firebase
import Foundation

class NotificationsViewModel: ObservableObject {
    @Published var notifications = [Notification]()

    func fetchNotifications() {}

    static func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let user = AuthViewModel.shared.currentUser else { return }

        var data: [String: Any] = [
            "timestamp": Timestamp(date: Date()),
            "userName": user.userName,
            "uid": user.uid,
            "profileImageUrl": user.profileImageUrl,
            "type": type.rawValue
        ]
        if let post = post, let id = post.id {
            data["postId"] = id
        }

        COLLECTION_NOTIFICATIONS.document(uid)
            .collection("user-notifications")
            .addDocument(data: data)
    }
}

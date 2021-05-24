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

    init() {
        fetchNotifications()
    }

    func fetchNotifications() {
        guard let uid = AuthViewModel.shared.currentUser?.uid else { return }

        let query = COLLECTION_NOTIFICATIONS.document(uid)
            .collection("user-notifications")
            .order(by: "timestamp", descending: true)

        query.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.notifications = documents.compactMap { try? $0.data(as: Notification.self) }
            print(self.notifications)
        }
    }

    static func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard uid != user.uid else { return }

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

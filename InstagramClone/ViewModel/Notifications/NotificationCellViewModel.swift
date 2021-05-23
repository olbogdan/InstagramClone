//
//  NotificationCellViewModel.swift
//  InstagramClone
//
//  Created by bogdanov on 23.05.21.
//

import SwiftUI

class NotificationCellViewModel: ObservableObject {
    @Published var notification: Notification

    init(notification: Notification) {
        self.notification = notification
        checkIfUserIsFollowed()
    }

    func follow() {
        UserService.follow(uid: notification.uid) { error in
            if let error = error {
                print("follow \(error)")
            } else {
                print("Successfully followed \(self.notification.userName)")
                self.notification.isFollowed = true
            }
        }
    }

    func unfollow() {
        UserService.unfollow(uid: notification.uid) { error in
            if let error = error {
                print("unfollow \(error)")
            } else {
                print("Successfully unfollowed \(self.notification.userName)")
                self.notification.isFollowed = false
            }
        }
    }

    func checkIfUserIsFollowed() {
        guard notification.type == .follow else { return }
        UserService.checkIffUserIsFollowed(uid: notification.uid) { isFollowed in
            self.notification.isFollowed = isFollowed
        }
    }

    func fetchNotificationPost() {}
}

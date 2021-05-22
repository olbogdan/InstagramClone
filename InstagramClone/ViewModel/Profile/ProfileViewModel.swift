//
//  ProfileViewModel.swift
//  InstagramClone
//
//  Created by bogdanov on 20.05.21.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
    }
    
    func follow() {
        UserService.follow(uid: user.uid) { error in
            if let error = error {
                print("follow \(error)")
            } else {
                print("Successfully followed \(self.user.userName)")
                self.user.isFollowed = true
                NotificationsViewModel.uploadNotification(toUid: self.user.uid, type: .follow)
            }
        }
    }
    
    func unfollow() {
        UserService.unfollow(uid: user.uid) { error in
            if let error = error {
                print("unfollow \(error)")
            } else {
                print("Successfully unfollowed \(self.user.userName)")
                self.user.isFollowed = false
            }
        }
    }
    
    func checkIfUserIsFollowed() {
        guard !user.isCurrentUser else { return }
        UserService.checkIffUserIsFollowed(uid: user.uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
}

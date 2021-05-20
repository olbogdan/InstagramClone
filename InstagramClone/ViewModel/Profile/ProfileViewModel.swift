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
    }
    
    func follow() {
        UserService.follow(uid: user.uid) { error in
            if let error = error {
                print("unfollow \(error)")
            } else {
                print("Successfully followed \(self.user.userName)")
                self.user.isFollowed = true
            }
        }
    }
    
    func unfollow() {
        print("unfollow")
    }
    
    func checkIfUserIsFollowed() {}
}

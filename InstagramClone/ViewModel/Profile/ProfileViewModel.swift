//
//  ProfileViewModel.swift
//  InstagramClone
//
//  Created by bogdanov on 20.05.21.
//

import Foundation

class ProfileViewModel: ObservableObject {
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func follow() {
        print("follow")
    }
    
    func unfollow() {
        print("unfollow")
    }
    
    func checkIfUserIsFollowed() {}
}

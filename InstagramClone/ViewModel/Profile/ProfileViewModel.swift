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
        fetchUserStats()
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
    
    func fetchUserStats() {
        fetchUserFollowing()
        fetchUserFollowers()
        fetchUserPosts()
    }
    
    func fetchUserFollowing() {
        COLLECTION_FOLLOWING.document(user.uid)
            .collection("user-following")
            .getDocuments { snapshot, error in
                if let error = error {
                    print("fetchUserFollowing user-following \(error)")
                } else {
                    var state = self.user.stats ?? UserStats()
                    state.following = snapshot?.count ?? 0
                    self.user.stats = state
                }
            }
    }
    
    func fetchUserFollowers() {
        COLLECTION_FOLLOWERS.document(user.uid)
            .collection("user-followers")
            .getDocuments { snapshot, error in
                if let error = error {
                    print("fetchUserFollowers user-followers \(error)")
                } else {
                    var state = self.user.stats ?? UserStats()
                    state.followers = snapshot?.count ?? 0
                    self.user.stats = state
                }
            }
    }
    
    func fetchUserPosts() {
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: user.uid)
            .getDocuments { snapshot, error in
                if let error = error {
                    print("fetchUserPosts \(error)")
                } else {
                    var state = self.user.stats ?? UserStats()
                    state.posts = snapshot?.count ?? 0
                    self.user.stats = state
                }
            }
    }
}

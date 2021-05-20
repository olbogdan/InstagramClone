//
//  UserService.swift
//  InstagramClone
//
//  Created by bogdanov on 20.05.21.
//

import Foundation

struct UserService {
    static func follow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        COLLECTION_FOLLOWING
            .document(currentUid)
            .collection("user-following")
            .document(uid)
            .setData([:]) { error in
                if let error = error {
                    if let completion = completion {
                        completion(error)
                    }
                    return
                }
                updateFollowers(uid: uid, currentUid: currentUid, completion: completion)
            }
    }

    private static func updateFollowers(uid: String, currentUid: String, completion: ((Error?) -> Void)?) {
        COLLECTION_FOLLOWERS
            .document(uid)
            .collection("user-followers")
            .document(currentUid)
            .setData([:], completion: completion)
    }

    static func unfollow() {}

    static func checkIffUserIsFollowed() {}
}

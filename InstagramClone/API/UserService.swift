//
//  UserService.swift
//  InstagramClone
//
//  Created by bogdanov on 20.05.21.
//

import Firebase

typealias FirestoreCompletion = ((Error?) -> Void)?

struct UserService {
    static func follow(uid: String, completion: FirestoreCompletion) {
        guard let following = getFollowingDocumentOfCurrentUser(to: uid) else { return }
        following.setData([:]) { error in
            if let error = error {
                if let completion = completion {
                    completion(error)
                }
                return
            }
            guard let followers = getFollowersDocumentOfUserToCurrentUser(ofUser: uid) else { return }
            followers.setData([:], completion: completion)
        }
    }

    static func unfollow(uid: String, completion: FirestoreCompletion) {
        guard let following = getFollowingDocumentOfCurrentUser(to: uid) else { return }
        following.delete { error in
            if let error = error {
                if let completion = completion {
                    completion(error)
                }
                return
            } else {
                guard let followers = getFollowersDocumentOfUserToCurrentUser(ofUser: uid) else { return }
                followers.delete(completion: completion)
            }
        }
    }

    static func checkIffUserIsFollowed(uid: String, completion: @escaping (Bool) -> Void) {
        guard let following = getFollowingDocumentOfCurrentUser(to: uid) else { return }
        following.getDocument { snapshot, _ in
            completion(snapshot?.exists == true)
        }
    }

    private static func getFollowingDocumentOfCurrentUser(to uid: String) -> DocumentReference? {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return nil }
        return COLLECTION_FOLLOWING
            .document(currentUid)
            .collection("user-following")
            .document(uid)
    }

    private static func getFollowersDocumentOfUserToCurrentUser(ofUser uid: String) -> DocumentReference? {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return nil }
        return COLLECTION_FOLLOWERS
            .document(uid)
            .collection("user-followers")
            .document(currentUid)
    }
}

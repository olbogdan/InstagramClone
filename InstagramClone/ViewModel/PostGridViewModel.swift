//
//  PostGridViewModel.swift
//  InstagramClone
//
//  Created by bogdanov on 21.05.21.
//

import Firebase
import SwiftUI

enum PostGridConfiguration {
    case explore
    case profile(String)
}

class PostGridViewModel: ObservableObject {
    @Published var posts = [Post]()

    init(config: PostGridConfiguration) {
        fetchPosts(forConfig: config)
    }

    private func fetchPosts(forConfig config: PostGridConfiguration) {
        switch config {
            case .explore:
                fetchAllPosts()
            case .profile(let uid):
                fetchUserPosts(forUid: uid)
        }
    }

    private func fetchUserPosts(forUid uid: String) {
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments(completion: compilation)
    }

    private func fetchAllPosts() {
        COLLECTION_POSTS.getDocuments(completion: compilation)
    }

    private func compilation(snapshot: QuerySnapshot?, error: Error?) {
        if let error = error {
            print("DEBUG: fetch posts \(error)")
            return
        }
        guard let posts = snapshot?.documents else { return }
        self.posts = posts.compactMap { try? $0.data(as: Post.self) }
        print("DEBUG: posts fetched, count: \(posts.count)")
    }
}

//
//  FeedViewModel.swift
//  InstagramClone
//
//  Created by bogdanov on 21.05.21.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()

    init() {
        fetchPosts()
    }

    func fetchPosts() {
        COLLECTION_POSTS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap { try? $0.data(as: Post.self) }
        }
    }
}
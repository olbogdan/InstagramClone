//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by bogdanov on 18.05.21.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [User]()

    init() {
        fetchUsers()
    }

    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, error in
            if let error = error {
                print("DEBUG: fetchUsers \(error)")
                return
            }

            guard let documents = snapshot?.documents else { return }
            self.users = documents.compactMap { try? $0.data(as: User.self) }
        }
    }
}

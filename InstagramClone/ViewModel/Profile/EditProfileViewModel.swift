//
//  EditProfileViewModel.swift
//  InstagramClone
//
//  Created by bogdanov on 25.05.21.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    var user: User
    @Published var uploadComplete = false

    init(user: User) {
        self.user = user
    }

    func saveUserData(_ bio: String) {
        print("save user data")
        COLLECTION_USERS.document(user.uid)
            .updateData(["bio": bio]) { error in
                if let error = error {
                    print("update profile \(error)")
                } else {
                    self.user.bio = bio
                    self.uploadComplete = true
                }
            }
    }
}

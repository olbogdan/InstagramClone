//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by bogdanov on 20.05.21.
//

import Firebase
import SwiftUI

class UploadPostViewModel: ObservableObject {
    func uploadPost(caption: String, image: UIImage) {
        guard let user = AuthViewModel.shared.currentUser else {
            return
        }
        ImageUploader.uploadImage(image: image, type: UploadType.post) { imageUrl in
            let data = [
                "caption": caption,
                "timestamp": Timestamp(date: Date()),
                "likes": 0,
                "imageUrl": imageUrl ?? "",
                "ownerUid": user.uid,
                "ownerImageUrl": user.profileImageUrl,
                "ownerUserName": user.userName
            ] as [String: Any]

            COLLECTION_POSTS.addDocument(data: data) { error in
                if let error = error {
                    print("DEBUG: Uploaded post error \(error)")
                } else {
                    print("DEBUG: Uploaded post")
                }
            }
        }
    }
}

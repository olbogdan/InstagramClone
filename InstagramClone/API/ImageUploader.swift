//
//  ImageUploader.swift
//  InstagramClone
//
//  Created by bogdanov on 18.05.21.
//

import Firebase
import UIKit

enum UploadType {
    case profile
    case post

    var filePath: StorageReference {
        let fileName = NSUUID().uuidString
        let path: String
        switch self {
            case .profile:
                path = "/profile_images/"
            case .post:
                path = "/post_images"
        }
        return Storage.storage().reference(withPath: path + fileName)
    }
}

enum ImageUploader {
    static func uploadImage(image: UIImage?, type: UploadType, completion: @escaping (String?) -> Void) {
        if let image = image {
            guard let imageData = image.jpegData(compressionQuality: 0.5) else {
                print("DEBUG: Failed to compression image")
                completion(nil)
                return
            }

            let ref = type.filePath
            ref.putData(imageData, metadata: nil) { _, error in
                if let error = error {
                    completion(nil)
                    print("DEBUG: Failed to upload image \(error)")
                    return
                }

                ref.downloadURL { url, error in
                    if let error = error {
                        print("DEBUG: Failed to downloadURL \(error)")
                    } else {
                        guard let imageUrl = url?.absoluteString else { return }
                        completion(imageUrl)
                    }
                }
            }
        } else {
            completion(nil)
        }
    }
}

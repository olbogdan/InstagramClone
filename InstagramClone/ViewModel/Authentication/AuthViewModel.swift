//
//  AuthViewModel.swift
//  InstagramClone
//
//  Created by bogdanov on 17.05.21.
//

import Firebase
import Foundation
import UIKit

class AuthViewModel: ObservableObject {
    @Published var userSession: Firebase.User?
    @Published var currentUser: User?
    @Published var didSendResetPasswordLink = false
    
    static let shared = AuthViewModel()

    private init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Login failed \(error)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    fileprivate func updateProfile(user: Firebase.User, withEmail email: String, image: UIImage?, fullName: String, userName: String) {
        ImageUploader.uploadImage(image: image, type: UploadType.profile) { imageUrl in
            print("DEBUG: updateProfile started")
            let data: [String: Any] = [
                "uid": user.uid,
                "email": email,
                "userName": userName,
                "fullName": fullName,
                "profileImageUrl": imageUrl ?? ""
            ]
            
            COLLECTION_USERS.document(user.uid).setData(data) { error in
                if let error = error {
                    print("DEBUG: upload user data failed: \(error)")
                } else {
                    self.fetchUser()
                }
            }
        }
    }
    
    func register(withEmail email: String, password: String, image: UIImage?, fullName: String, userName: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("Successfully registered user")

            self.updateProfile(user: user, withEmail: email, image: image, fullName: fullName, userName: userName)
        }
    }
    
    func signOut() {
        userSession = nil
        currentUser = nil
        do {
            try Auth.auth().signOut()
        } catch {
            print("error: \(error).")
        }
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            print(snapshot?.data())
            self.currentUser = try? snapshot?.data(as: User.self)
        }
    }
    
    func resetPassword(withEmail email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("failed reset password \(error)")
            } else {
                print("reset password: success")
                self.didSendResetPasswordLink = true
            }
        }
    }
}

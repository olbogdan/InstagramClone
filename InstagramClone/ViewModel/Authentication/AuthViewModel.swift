//
//  AuthViewModel.swift
//  InstagramClone
//
//  Created by bogdanov on 17.05.21.
//

import Firebase
import Foundation

class AuthViewModel: ObservableObject {
    @Published var userSession: Firebase.User?
    
    init() {
        userSession  = Auth.auth().currentUser
    }
    
    func login() {
        print("login")
    }
    
    func register(withEmail email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("Successfully registered user")
        }
    }
    
    func signOut() {}
    
    func fetchUser() {}
    
    func resetPassword() {}
}

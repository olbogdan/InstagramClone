//
//  InstagramCloneApp.swift
//  InstagramClone
//
//  Created by bogdanov on 10.05.21.
//

import Firebase
import SwiftUI

@main
struct InstagramCloneApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}

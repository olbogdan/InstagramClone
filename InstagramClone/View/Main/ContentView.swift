//
//  ContentView.swift
//  InstagramClone
//
//  Created by bogdanov on 17.05.21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                if let user = viewModel.currentUser {
                    MainTabView(user: user)
                } else {
                    ProgressView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

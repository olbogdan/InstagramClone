//
//  MainTabView.swift
//  InstagramClone
//
//  Created by bogdanov on 10.05.21.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var user: User
    @Binding var selectedIndex: Int
    private let tabs = [
        0: "Feed",
        1: "Explore",
        2: "New Post",
        3: "Notifications",
        4: "Profile"
    ]

    var body: some View {
        NavigationView {
            TabView(selection: $selectedIndex) {
                FeedView()
                    .tabItem {
                        Image(systemName: "house")
                    }.tag(0)
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }.tag(1)
                UploadPostView(tabIndex: $selectedIndex)
                    .tabItem {
                        Image(systemName: "plus.square")
                    }.tag(2)
                NotificationsView()
                    .tabItem {
                        Image(systemName: "heart")
                    }.tag(3)
                ProfileView(user: user)
                    .tabItem {
                        Image(systemName: "person")
                    }.tag(4)
            }
            .accentColor(.black)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: logoutButton)
            .accentColor(.black)
            .navigationBarTitle(tabs[selectedIndex] ?? "")
        }
    }

    var logoutButton: some View {
        Button {
            viewModel.signOut()
        } label: {
            Text("Logout").foregroundColor(.black)
        }
    }
}

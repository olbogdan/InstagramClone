//
//  MainTabView.swift
//  InstagramClone
//
//  Created by bogdanov on 10.05.21.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            TabView {
                FeedView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                
                UploadPostView()
                    .tabItem {
                        Image(systemName: "plus.square")
                    }
                
                NotificationsView()
                    .tabItem {
                        Image(systemName: "heart")
                    }
                
//                ProfileView()
//                    .tabItem {
//                        Image(systemName: "person")
//                    }
            }
            .accentColor(.black)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: logoutButton)
            .accentColor(.black)
            .navigationBarTitle("Home")
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

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

//
//  ProfileView.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ProfileHeaderView(user: user)
                PostGridView()
            }
        }.padding(.top)
    }
}

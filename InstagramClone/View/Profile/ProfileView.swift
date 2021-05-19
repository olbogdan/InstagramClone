//
//  ProfileView.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import SwiftUI

struct ProfileView: View {

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ProfileHeaderView()
                PostGridView()
            }
        }.padding(.top)
    }
}

//
//  UserListView.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView  {
            LazyVStack {
                ForEach(0..<20) { _ in
                    UserCell()
                        .padding(.leading)
                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}

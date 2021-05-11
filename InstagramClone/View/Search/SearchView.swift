//
//  SearchView.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @State var inSearchMode = false

    var body: some View {
        ScrollView {
            // search bar
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            ZStack {
                if inSearchMode {
                    UserListView()
                } else {
                    PostGridView()
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

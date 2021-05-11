//
//  SearchView.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""

    var body: some View {
        ScrollView {
            // search bar
            SearchBar(text: $searchText)
                .padding()
            PostGridView()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

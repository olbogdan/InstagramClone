//
//  SearchBar.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool

    var body: some View {
        HStack {
            TextField("Search ...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 8)
                ).onTapGesture {
                    isEditing = true
                }
            if isEditing {
                Button(action: {
                    isEditing = false
                    text = ""
                    UIApplication.shared.endEditing()
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }.animation(.default)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."), isEditing: .constant(true))
    }
}

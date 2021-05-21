//
//  TextArea.swift
//  InstagramClone
//
//  Created by bogdanov on 21.05.21.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    var placeholder: String

    init(text: Binding<String>, placeholder: String) {
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }

            TextEditor(text: $text)
                .padding(4)
        }.font(.body)
    }
}

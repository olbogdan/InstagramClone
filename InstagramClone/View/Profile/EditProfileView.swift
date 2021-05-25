//
//  EditProfileView.swift
//  InstagramClone
//
//  Created by bogdanov on 25.05.21.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bioText = ""

    var body: some View {
        VStack {
            HStack {
                Button(action: {}) {
                    Text("Cancel")
                }
                Spacer()
                Button(action: {}) {
                    Text("Done")
                        .bold()
                }
            }.padding()

            TextArea(text: $bioText, placeholder: "add user bio...")
                .padding(.horizontal)
            Spacer()
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}

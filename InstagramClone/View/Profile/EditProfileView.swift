//
//  EditProfileView.swift
//  InstagramClone
//
//  Created by bogdanov on 25.05.21.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.presentationMode) var mode
    @State private var bioText: String
    @ObservedObject private var viewModel: EditProfileViewModel
    @Binding private var user: User

    init(user: Binding<User>) {
        self._user = user
        self.viewModel = EditProfileViewModel(user: user.wrappedValue)
        self._bioText = State(initialValue: user.wrappedValue.bio ?? "")
    }

    var body: some View {
        VStack {
            HStack {
                Button(action: { mode.wrappedValue.dismiss() }) {
                    Text("Cancel")
                }
                Spacer()
                Button(action: { viewModel.saveUserData(bioText) }) {
                    Text("Done")
                        .bold()
                }
            }.padding()

            TextArea(text: $bioText, placeholder: "add user bio...")
                .padding(.horizontal)
            Spacer()
        }.onReceive(viewModel.$uploadComplete, perform: { completed in
            if completed {
                mode.wrappedValue.dismiss()
                self.user.bio = viewModel.user.bio
            }
        })
    }
}

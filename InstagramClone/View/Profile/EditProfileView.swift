//
//  EditProfileView.swift
//  InstagramClone
//
//  Created by bogdanov on 25.05.21.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bioText = ""
    @ObservedObject private var viewModel: EditProfileViewModel
    @Environment(\.presentationMode) var mode

    init(viewModel: EditProfileViewModel) {
        self.viewModel = viewModel
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
            }
        })
    }
}

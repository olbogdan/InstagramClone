//
//  RegistrationView.swift
//  InstagramClone
//
//  Created by bogdanov on 14.05.21.
//

import SwiftUI

struct RegistrationView: View {
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var userImage: Image?
    @State private var email: String = ""
    @State private var userName: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Button(action: {
                    imagePickerPresented = true
                }) {
                    if let image = userImage {
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 140, height: 140)
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 140, height: 140)
                    }
                }
                .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
                    ImagePicker(image: $selectedImage)
                }
                .padding()

                VStack(spacing: 20) {
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 32)

                    CustomTextField(text: $userName, placeholder: Text("Username"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 32)

                    CustomTextField(text: $fullName, placeholder: Text("Full Name"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 32)

                    CustomSecureField(text: $password, placeholder: Text("Password"), imageName: "lock")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 32)
                }

                Button(action: {
                    viewModel.register(withEmail: email, password: password, image: selectedImage, fullName: fullName, userName: userName)
                }) {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(minWidth: 310)
                        .frame(height: 50)
                        .background(Color(#colorLiteral(red: 0.9507724643, green: 0.5001342297, blue: 0.6873406172, alpha: 0.5170878715)))
                        .clipShape(Capsule())
                        .padding()
                }
                Spacer()
                Button(action: {
                    mode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }.foregroundColor(.white)
                }.padding(.bottom, 16)
            }
        }
    }
}

extension RegistrationView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        userImage = Image(uiImage: selectedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

//
//  ResetPasswordView.swift
//  InstagramClone
//
//  Created by bogdanov on 14.05.21.
//

import SwiftUI

struct ResetPasswordView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Binding var email: String
    @Environment(\.presentationMode) var mode

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Image("img_instagram_logo")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 220)
                    .foregroundColor(.white)
                    .padding(.top, 64)

                CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 32)

                HStack {
                    Spacer()

                    Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/) {
                        Text("Forgot passord?")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.top)
                            .padding(.trailing, 28)
                    }
                }

                Button(action: {
                    viewModel.resetPassword()
                }) {
                    Text("Sign In")
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

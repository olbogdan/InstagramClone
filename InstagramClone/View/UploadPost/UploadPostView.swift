//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    @ObservedObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int

    var body: some View {
        VStack {
            if postImage == nil {
                Button(action: {
                    imagePickerPresented.toggle()
                }) {
                    Image(systemName: "icloud.and.arrow.up.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .padding(.top, 56)
                        .foregroundColor(.black)
                }
                .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
                    ImagePicker(image: $selectedImage)
                }
            } else if let image = postImage {
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()

                    TextArea(text: $captionText, placeholder: "Enter your caption..")
                        .frame(height: 200)
                }
                .padding()

                Button(action: {
                    if let image = selectedImage {
                        viewModel.uploadPost(caption: captionText, image: image) { error in
                            if let error = error {
                                print("upload post error \(error)")
                            } else {
                                postImage = nil
                                captionText = ""
                                tabIndex = 0
                            }
                        }
                    }
                }) {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }
                .padding()
            }
            Spacer()
        }
    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

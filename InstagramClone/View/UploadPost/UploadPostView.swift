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

    var body: some View {
        VStack {
            if postImage == nil {
                Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "icloud.and.arrow.up.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .padding(.top, 56)
                        .foregroundColor(.black)
                }
            } else {
                HStack(alignment: .top) {
                    Image("img1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()

                    TextField("Enter your caption..", text: $captionText)
                }
                .padding()

                Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/) {
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

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}

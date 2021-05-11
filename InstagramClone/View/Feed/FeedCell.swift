//
//  FeedCell.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import SwiftUI

struct FeedCell: View {
    var geometryProxy: GeometryProxy
    
    var body: some View {
        
            VStack(alignment: .leading) {
                //user info
                HStack {
                    Image("img5")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .clipped()
                        .cornerRadius(18)
                    
                    Text("joker")
                        .font(.system(size: 14, weight: .semibold))
                }
                .padding([.leading, .bottom], 8)
                
                // post image
                Image("img1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometryProxy.size.width)
                    .frame(maxHeight: 440)
                    .clipped()
                
                
                // action buttons
                ActionButtonsView()
                
                // caption
                
                Text("3 likes")
                    .font(.system(size: 14, weight: .semibold))
                    .padding(.leading, 8)
                    .padding(.bottom, 4)
                
                DescriptionView()
                
                Text("2d")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding([.leading], 8)
            }
        }
        
    
}

struct ActionButtonsView: View {
    var body: some View {
        HStack(spacing: 16) {
            Button(action: {}) {
                Image(systemName: "heart")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .font(.system(size: 20))
            }
            Button(action: {}) {
                Image(systemName: "bubble.right")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .font(.system(size: 20))
            }
            Button(action: {}) {
                Image(systemName: "paperplane")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .font(.system(size: 20))
            }
        }
        .padding(.leading, 4)
        .foregroundColor(.black)
    }
}

struct DescriptionView: View {
    var body: some View {
        Group {
            Text("Doctor").font(.system(size: 14, weight: .semibold))
                + Text(" Healthy and beauty, be in a correct place in correct time.")
                .font(.system(size: 15))
        }.padding(.horizontal, 8)
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            FeedCell(geometryProxy: geometry)
        }
    }
}


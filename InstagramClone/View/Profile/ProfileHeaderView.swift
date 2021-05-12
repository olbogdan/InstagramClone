//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("img7")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .background(Color(.systemBlue))
                    .clipShape(Circle())
                    .padding(.leading)

                HStack(alignment: .center) {
                    Spacer()
                    UserStatView(value: 22, title: "Posts")
                    UserStatView(value: 10040, title: "Followers")
                    UserStatView(value: 450, title: "Following")
                    Spacer()
                }
            }

            Text("Doctor Who")
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])

            Text("Back in feature expert || traveler with a time machine")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)

            HStack {
           
            }
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}

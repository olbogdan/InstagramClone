//
//  FeedView.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                ForEach(0 ..< 2) { _ in
                    FeedCell(geometryProxy: geometry)
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

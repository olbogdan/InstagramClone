//
//  LazyView.swift
//  InstagramClone
//
//  Created by bogdanov on 24.05.21.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content

    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }

    var body: Content {
        build()
    }
}

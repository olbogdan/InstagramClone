//
//  NotificationCellViewModel.swift
//  InstagramClone
//
//  Created by bogdanov on 23.05.21.
//

import SwiftUI

class NotificationCellViewMode: ObservedObject {
    @Published var notification: Notification

    init(notification: Notification) {
        self.notification = notification
    }
}

//
//  NotificationItem.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-12.
//

import Foundation

enum NotificationSection: String, CaseIterable {
    case today = "TODAY"
    case yesterday = "YESTERDAY"
    case other = "OTHER"
}

struct NotificationItem: Identifiable {
    let id: String
    let type: NotificationType
    let title: String
    let description: String
    let timeText: String
    let date: Date
    let section: NotificationSection
    var isUnread: Bool
    
    init(id: String = UUID().uuidString,
         type: NotificationType,
         title: String,
         description: String,
         timeText: String,
         date: Date,
         section: NotificationSection,
         isUnread: Bool = false) {
        self.id = id
        self.type = type
        self.title = title
        self.description = description
        self.timeText = timeText
        self.date = date
        self.section = section
        self.isUnread = isUnread
    }
}

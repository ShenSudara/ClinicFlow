//
//  NotificationModel.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-11.
//

struct NotificationItem: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let timeAgo: String
    let iconName: String
    let iconColor: Color
    var isUnread: Bool
}

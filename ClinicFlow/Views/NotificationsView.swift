//
//  NotificationsView.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-11.
//

import SwiftUI

struct NotificationsView: View {
    
    let todayNotifications = [
        NotificationItem(title: "Your turn is next", description: "Please proceed to Room 302. Dr. Smith is ready to see you now.", timeAgo: "now", iconName: "bell", iconColor: .blue, isUnread: true),
        NotificationItem(title: "Appointment Reminder", description: "You have an upcoming appointment with Dr. Chen on Oct 15 at 10:00 AM.", timeAgo: "2h ago", iconName: "calendar.badge.clock", iconColor: .orange, isUnread: true),
        NotificationItem(title: "Payment Successful", description: "Your payment of Rs.25000.00 for today's visit processed successfully.", timeAgo: "3h ago", iconName: "wallet.pass", iconColor: .green, isUnread: true)
    ]
    
    let yesterdayNotifications = [
        NotificationItem(title: "Your turn is next", description: "Please proceed to Room 302. Dr. Smith is ready to see you now.", timeAgo: "now", iconName: "bell", iconColor: .blue, isUnread: false),
        NotificationItem(title: "Appointment Reminder", description: "You have an upcoming appointment with Dr. Chen on Oct 15 at 10:00 AM.", timeAgo: "2h ago", iconName: "calendar.badge.clock", iconColor: .orange, isUnread: false),
        NotificationItem(title: "Payment Successful", description: "Your payment of Rs.25000.00 for today's visit processed successfully.", timeAgo: "3h ago", iconName: "wallet.pass", iconColor: .green, isUnread: false)
    ]
    
    let otherNotifications = [
        NotificationItem(title: "Your turn is next", description: "Please proceed to Room 302. Dr. Smith is ready to see you now.", timeAgo: "now", iconName: "bell", iconColor: .blue, isUnread: false),
        NotificationItem(title: "Appointment Reminder", description: "You have an upcoming appointment with Dr. Chen on Oct 15 at 10:00 AM.", timeAgo: "2h ago", iconName: "calendar.badge.clock", iconColor: .orange, isUnread: false),
        NotificationItem(title: "Payment Successful", description: "Your payment of Rs.25000.00 for today's visit processed successfully.", timeAgo: "3h ago", iconName: "wallet.pass", iconColor: .green, isUnread: false)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            MainHeader(title: "Notifications", profileImageName: "UserAvatar")
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    NotificationSection(title: "TODAY", items: todayNotifications)
                    NotificationSection(title: "YESTERDAY", items: yesterdayNotifications)
                    NotificationSection(title: "OTHER", items: otherNotifications)
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
            }
        }
        .commonBackground()
    }
}

struct NotificationSection: View {
    let title: String
    let items: [NotificationItem]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.gray)
            
            ForEach(items) { item in
                NotificationRow(notification: item)
                if item.id != items.last?.id {
                    Divider().padding(.leading, 65)
                }
            }
        }
    }
}

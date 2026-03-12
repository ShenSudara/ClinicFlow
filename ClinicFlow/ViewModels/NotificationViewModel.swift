//
//  NotificationViewModel.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-12.
//

import Foundation
import SwiftUI
import Combine

class NotificationViewModel: ObservableObject {
    @Published var notifications: [NotificationItem] = []
    
    init() {
        loadSampleData()
    }
    
    private func makeDate(daysAgo: Int, hour: Int = 9, minute: Int = 0) -> Date {
        var comp = DateComponents()
        comp.day = -daysAgo
        comp.hour = hour
        comp.minute = minute
        return Calendar.current.date(byAdding: comp, to: Date()) ?? Date()
    }
    
    func loadSampleData() {
        // Today
        let now = Date()
        notifications = [
            NotificationItem(type: .turn, title: "Your turn is next", description: "Please proceed to Room 202.", timeText: "now", date: now, section: .today, isUnread: true),
            NotificationItem(type: .appointment, title: "Appointment Reminder", description: "You have an upcoming appointment with Dr. Smith.", timeText: "2h ago", date: makeDate(daysAgo: 0, hour: Calendar.current.component(.hour, from: now)-2), section: .today, isUnread: false),
            NotificationItem(type: .payment, title: "Payment Successful", description: "Your payment of Rs. 2000.00 has been processed.", timeText: "1h ago", date: makeDate(daysAgo: 0, hour: Calendar.current.component(.hour, from: now)-1), section: .today, isUnread: false),
            // Yesterday
            NotificationItem(type: .lab, title: "Lab Results Available", description: "Your blood test results are ready to view.", timeText: "Yesterday", date: makeDate(daysAgo: 1), section: .yesterday, isUnread: false),
            NotificationItem(type: .payment, title: "Payment Successful", description: "Your payment of Rs. 500.00 has been processed.", timeText: "Yesterday", date: makeDate(daysAgo: 1, hour: 15), section: .yesterday, isUnread: false),
            NotificationItem(type: .appointment, title: "Appointment Reminder", description: "Reminder: Appointment with Dr. K.", timeText: "Yesterday", date: makeDate(daysAgo: 1, hour: 11), section: .yesterday, isUnread: false),
            // Other
            NotificationItem(type: .appointment, title: "Appointment Reminder", description: "Appointment on Oct 13 with Dr. Lee.", timeText: "Oct 13", date: makeDate(daysAgo: 30), section: .other, isUnread: false)
        ]
    }
    
    // Helpers to group
        var today: [NotificationItem] { notifications.filter { $0.section == .today } }
        var yesterday: [NotificationItem] { notifications.filter { $0.section == .yesterday } }
        var other: [NotificationItem] { notifications.filter { $0.section == .other } }
        
        // Toggle read/unread
        func markAsRead(_ id: String) {
            if let idx = notifications.firstIndex(where: { $0.id == id }) {
                notifications[idx].isUnread = false
            }
        }
    }

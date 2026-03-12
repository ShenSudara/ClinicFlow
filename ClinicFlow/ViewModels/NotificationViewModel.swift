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

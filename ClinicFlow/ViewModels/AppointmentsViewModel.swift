//
//  AppointmentsViewModel.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-001 on 2026-03-12.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class AppointmentsViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var selectedTab: AppointmentTab = .upcoming
    @Published var upcoming: [AppointmentModel] = []
    @Published var past: [AppointmentModel] = []
    @Published var cancelled: [AppointmentModel] = []
    
    enum AppointmentTab: String, CaseIterable, Identifiable {
        case upcoming = "Upcoming"
        case past = "Past"
        case cancelled = "Cancelled"
        var id: String { rawValue }
    }
    
    
    private func makeDate(year: Int = 2026, month: Int, day: Int, hour: Int = 9, minute: Int = 0) -> Date {
            var comps = DateComponents()
            comps.year = year
            comps.month = month
            comps.day = day
            comps.hour = hour
            comps.minute = minute
            return Calendar.current.date(from: comps) ?? Date()
        }

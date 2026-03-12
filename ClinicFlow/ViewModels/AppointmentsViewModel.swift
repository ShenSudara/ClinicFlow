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
    
    init() {
            loadData()
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

    func loadData() {
            upcoming = [
                AppointmentModel(doctorName: "Dr. Ashen Sudaraka", specialty: "General Checkup", date: makeDate(month: 3, day: 10, hour: 10, minute: 30), time: "10:30 AM", status: .pending),
                AppointmentModel(doctorName: "Dr. Shanel Perera", specialty: "Cardiology", date: makeDate(month: 3, day: 10, hour: 12, minute: 30), time: "12:30 PM", status: .ongoing)
            ]

            past = [
                AppointmentModel(doctorName: "Dr. Ashen Sudaraka", specialty: "General Checkup", date: makeDate(month: 2, day: 22), time: "10:30 AM", status: .completed),
                AppointmentModel(doctorName: "Dr. Jane William", specialty: "Dermatology", date: makeDate(month: 2, day: 20), time: "11:00 AM", status: .completed)
            ]
            
            cancelled = [
                AppointmentModel(doctorName: "Dr. Ashen Sudaraka", specialty: "General Checkup", date: makeDate(month: 2, day: 10), time: "9:00 AM", status: .cancelled),
                AppointmentModel(doctorName: "Dr. Ashen Sudaraka", specialty: "General Checkup", date: makeDate(month: 1, day: 7), time: "9:00 AM", status: .cancelled)
            ]
        }
    
    var filteredUpcoming: [AppointmentModel] {
            if searchText.isEmpty { return upcoming }
            return upcoming.filter { $0.doctorName.localizedCaseInsensitiveContains(searchText) || $0.specialty.localizedCaseInsensitiveContains(searchText) }
        }
        var filteredPast: [AppointmentModel] {
            if searchText.isEmpty { return past }
            return past.filter { $0.doctorName.localizedCaseInsensitiveContains(searchText) || $0.specialty.localizedCaseInsensitiveContains(searchText) }
        }
        var filteredCancelled: [AppointmentModel] {
            if searchText.isEmpty { return cancelled }
            return cancelled.filter { $0.doctorName.localizedCaseInsensitiveContains(searchText) || $0.specialty.localizedCaseInsensitiveContains(searchText) }
        }
    }

//
//  BookAppointmentViewModel.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-13.
//

import Foundation
import SwiftUI
import Combine


class BookAppointmentViewModel: ObservableObject {
    struct ClinicModel: Identifiable {
        let id: String
        let name: String
        let address: String
    }

    @Published var selectedClinic: String = ""
    @Published var selectedDate: Date = Date()
    @Published var selectedTimeSlot: String = ""
    @Published var bookingSuccess: Bool = false

    let clinics: [ClinicModel] = [
        ClinicModel(id: "c1", name: "City Health Clinic", address: "123 Main St"),
        ClinicModel(id: "c2", name: "Green Valley Clinic", address: "45 Green Rd"),
        ClinicModel(id: "c3", name: "RiverSide Medical", address: "9 River Ave")
    ]

    let morningSlots: [String]
    let afternoonSlots: [String]
    let disabledSlots: [String] = ["09:30 AM", "01:15 PM", "01:45 PM"]

    var isConfirmEnabled: Bool {
        !selectedClinic.isEmpty && !selectedTimeSlot.isEmpty
    }

    init() {
        morningSlots = BookAppointmentViewModel.generateSlots(startHour: 9, startMinute: 0, endHour: 11, endMinute: 0, intervalMinutes: 15)
        afternoonSlots = BookAppointmentViewModel.generateSlots(startHour: 13, startMinute: 0, endHour: 14, endMinute: 15, intervalMinutes: 15)
    }

    static func generateSlots(startHour: Int, startMinute: Int, endHour: Int, endMinute: Int, intervalMinutes: Int) -> [String] {
        var slots: [String] = []
        var calendar = Calendar.current
        calendar.timeZone = TimeZone.current
        var components = DateComponents()
        components.hour = startHour
        components.minute = startMinute
        guard var date = calendar.date(from: components) else { return slots }
        var endComponents = DateComponents()
        endComponents.hour = endHour
        endComponents.minute = endMinute
        guard let endDate = calendar.date(from: endComponents) else { return slots }
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        while date <= endDate {
            slots.append(formatter.string(from: date))
            if let next = calendar.date(byAdding: .minute, value: intervalMinutes, to: date) {
                date = next
            } else {
                break
            }
        }
        return slots
    }

    func confirmAppointment() {
        // simulate booking confirmation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.bookingSuccess = true
        }
    }
}

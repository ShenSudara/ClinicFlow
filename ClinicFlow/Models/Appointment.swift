//
//  Appointment.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-12.
//

import Foundation
import SwiftUI

enum AppointmentStatus: String, CaseIterable, Identifiable {
    case pending = "Pending"
    case ongoing = "Ongoing"
    case completed = "Completed"
    
    var id: String { rawValue }
}

struct Appointment: Identifiable {
    let id: String
    let doctorName: String
    let clinicName: String
    let date: Date
    let status: AppointmentStatus
    let accent: Color
    
    init(id: String = UUID().uuidString,
         doctorName: String,
         clinicName: String,
         date: Date,
         status: AppointmentStatus = .pending,
         accent: Color = .blue) {
        self.id = id
        self.doctorName = doctorName
        self.clinicName = clinicName
        self.date = date
        self.status = status
        self.accent = accent
    }
}

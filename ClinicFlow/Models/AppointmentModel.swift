//
//  AppointmentModel.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-001 on 2026-03-12.
//

import Foundation
import SwiftUI

enum AppointmentStatus: String, CaseIterable, Identifiable {
    case pending
    case ongoing
    case completed
    case cancelled
    
    var id: String { rawValue }
}

struct AppointmentModel: Identifiable {
    let id: String
    let doctorName: String
    let specialty: String
    let date: Date
    let time: String
    let status: AppointmentStatus
    
    init(id: String = UUID().uuidString,
         doctorName: String,
         specialty: String,
         date: Date,
         time: String,
         status: AppointmentStatus) {
        self.id = id
        self.doctorName = doctorName
        self.specialty = specialty
        self.date = date
        self.time = time
        self.status = status
    }
}

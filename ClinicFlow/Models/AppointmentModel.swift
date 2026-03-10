//
//  AppointmentModel.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-10.
//

import SwiftUI

struct Appointment: Identifiable {
    let id = UUID()
    let doctorName: String
    let clinicName: String // Added for search
    let type: String
    let time: String
    let day: String
    let month: String
    let filterStatus: AppointmentFilter // .upcoming, .past, or .cancelled
    let displayStatus: String // "Pending", "Ongoing", etc.
    let color: Color
}

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
    let clinicName: String
    let time: String
    let day: String
    let month: String
    let filterStatus: AppointmentFilter
    let displayStatus: String
    let color: Color
}

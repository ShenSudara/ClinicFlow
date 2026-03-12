//
//  AppointmentRowView.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-12.
//

import SwiftUI

struct AppointmentRowView: View {
    let appointment: Appointment
    
    var body: some View {
        HStack(spacing: 12) {
            // Date box
            VStack {
                Text(shortMonth(from: appointment.date).uppercased())
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.primary)
                Text(dayString(from: appointment.date))
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.primary)
            }
            .frame(width: 60, height: 60)
            .background(appointment.accent.opacity(0.12))
            .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(appointment.doctorName)
                        .font(.system(size: 16, weight: .bold))
                    Spacer()
                    Text(timeString(from: appointment.date))
                        .font(.system(size: 12))
                        .subHeader2Color()
                }
                Text(appointment.clinicName)
                    .font(.system(size: 14))
                    .subHeader2Color()
                Text(appointment.status.rawValue)
                    .font(.system(size: 12, weight: .bold))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 6)
                    .background(backgroundColor(for: appointment.status).opacity(0.12))
                    .foregroundColor(backgroundColor(for: appointment.status))
                    .cornerRadius(8)
            }
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.04), radius: 6, x: 0, y: 3)
        .accessibilityElement(children: .combine)
    }

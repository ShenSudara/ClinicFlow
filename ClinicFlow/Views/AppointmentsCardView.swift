//
//  AppointmentsCardView.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-001 on 2026-03-12.
//

import SwiftUI

struct AppointmentsCardView: View {
    let appointment: AppointmentModel
    
    var statusColor: Color {
        switch appointment.status {
        case .pending: return Color.yellow
        case .ongoing: return Color.green
        case .completed: return Color.blue
        case .cancelled: return Color.red
        }
    }
    
    var body: some View {
        HStack(spacing: 12) {
            VStack {
                Text(shortMonth(from: appointment.date).uppercased())
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
                Text(dayString(from: appointment.date))
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
            }
            .frame(width: 56, height: 56)
            .background(statusColor.opacity(0.9))
            .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(appointment.doctorName)
                        .font(.system(size: 16, weight: .bold))
                    Spacer()
                    Text(appointment.time)
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                }
                Text(appointment.specialty)
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                
                HStack {
                    Text(appointment.status.rawValue.capitalized)
                        .font(.system(size: 12, weight: .bold))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 6)
                        .background(statusColor.opacity(0.12))
                        .foregroundColor(statusColor)
                        .cornerRadius(12)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 6, x: 0, y: 3)
    }
    
    private func shortMonth(from date: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "MMM"
        return df.string(from: date)
    }
    private func dayString(from date: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "d"
        return df.string(from: date)
    }
}

#Preview {
    AppointmentsCardView(appointment: AppointmentModel(doctorName: "Dr. Test", specialty: "General", date: Date(), time: "10:30 AM", status: .pending))
}

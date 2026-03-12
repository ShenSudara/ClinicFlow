//
//  NextAppointmentCard.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-12.
//

import SwiftUI

struct NextAppointmentCard: View {
    let appointment: Appointment
    let minutes: Int
    
    var body: some View {
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("NEXT APPOINTMENT")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white)
                        .padding(6)
                        .padding(.horizontal, 10)
                        .background(Color.white.opacity(0.18))
                        .cornerRadius(10)
                    HStack(spacing: 15) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 56, height: 56)
                            .foregroundColor(.white)
                            .background(Color.white.opacity(0.1))
                            .clipShape(Circle())
                        VStack(alignment: .leading, spacing: 8) {
                            Text(appointment.doctorName)
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                            Text(appointment.clinicName)
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white.opacity(0.9))
                            HStack{
                                Text("PENDING")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(6)
                                    .padding(.horizontal, 10)
                                    .background(Color.white.opacity(0.18))
                                    .cornerRadius(10)
                            }
                        }
                        Spacer()
                        Text(minutesText)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                    }.padding(.bottom, 25)
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color("IconBackground").opacity(0.5)),
                        alignment: .bottom
                    )
                    
                    HStack(spacing: 25) {
                        HStack(spacing: 8) {
                            Image(systemName: "calendar")
                                .foregroundColor(Color("SubHeader1"))
                            Text(shortDate(from: appointment.date))
                                .font(.system(size: 16))
                                .foregroundColor(Color("SubHeader1"))
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 15)
                        .background(Color("IconBackground"))
                        .cornerRadius(10)
                        
                        HStack(spacing: 8) {
                            Image(systemName: "clock")
                                .foregroundColor(Color("SubHeader1"))
                            Text(timeString(from: appointment.date))
                                .font(.system(size: 16))
                                .foregroundColor(Color("SubHeader1"))
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 15)
                        .background(Color("IconBackground"))
                        .cornerRadius(10)
                    }
                    .padding(.top, 25)
                    .padding(.bottom, 10)
                }
                .padding()
            }
            .background(LinearGradient(colors: [Color.blue, Color.green], startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.05), radius: 6, x: 0, y: 4)
        }
        
        private var minutesText: String {
            if minutes <= 0 { return "Now" }
            return "in \(minutes) min"
        }
        private func shortDate(from date: Date) -> String {
            let df = DateFormatter()
            df.dateFormat = "MMM d"
            return df.string(from: date)
        }
        private func timeString(from date: Date) -> String {
            let df = DateFormatter()
            df.dateFormat = "h:mm a"
            return df.string(from: date)
        }
    }

    #Preview {
        NextAppointmentCard(appointment: Appointment(doctorName: "Dr Ashen", clinicName: "General", date: Date().addingTimeInterval(1200), status: .pending, accent: .blue), minutes: 20)
    }

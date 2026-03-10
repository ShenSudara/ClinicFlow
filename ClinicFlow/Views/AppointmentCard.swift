//
//  AppointmentCard.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-10.
//

import SwiftUI

struct AppointmentCard: View {
    let doctorName: String
    let department: String
    let time: String
    let dateDay: String
    let dateMonth: String
    let status: String
    let statusColor: Color

    var body: some View {
        HStack(spacing: 15) {
            // Date Badge
            VStack {
                Text(dateMonth)
                    .font(.system(size: 14, weight: .bold))
                Text(dateDay)
                    .font(.system(size: 20, weight: .bold))
            }
            .foregroundColor(statusColor)
            .frame(width: 60, height: 70)
            .background(statusColor.opacity(0.1))
            .cornerRadius(12)
            
            // Doctor Info
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text(doctorName)
                                    .font(.system(size: 18, weight: .bold))
                                Spacer()
                                Text(time)
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                            
                            Text(department)
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                            
                            Text(status)
                                .font(.system(size: 12, weight: .bold))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(statusColor.opacity(0.15))
                                .foregroundColor(statusColor)
                                .cornerRadius(8)
                        }
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray.opacity(0.5))
                    }
            
            .padding()
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
                    .padding(.horizontal, 20)
                }
            }

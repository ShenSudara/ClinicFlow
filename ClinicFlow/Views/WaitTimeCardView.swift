//
//  WaitTimeCardView.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-001 on 2026-03-12.
//

import SwiftUI

struct WaitTimeCardView: View {
    let minutes: Int
    var onCancel: (() -> Void)?
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Ongoing")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color.white.opacity(0.12))
                .clipShape(Capsule())
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(alignment: .center, spacing: 12) {
                Text("\(minutes)")
                    .font(.system(size: 64, weight: .bold))
                    .foregroundColor(.white)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Minutes Wait")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                    Text("Estimated time until your Vitals check begins.")
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(0.9))
                }
                Spacer()
            }

            HStack(spacing: 12) {
                Button(action: {
                    onCancel?()
                }) {
                    Text("Cancel Appointment")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(Color("NPrimaryColor"))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Color.white)
                        .cornerRadius(10)
                }
                .buttonStyle(PlainButtonStyle())

                Button(action: {
                    
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white.opacity(0.12))
                            .frame(width: 44, height: 44)
                        Image(systemName: "calendar")
                            .foregroundColor(.white)
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(15)
        .padding(.vertical, 10)
        .background(Color("NPrimaryColor"))
        .cornerRadius(15)
    }
}

#Preview {
    WaitTimeCardView(minutes: 15)
}

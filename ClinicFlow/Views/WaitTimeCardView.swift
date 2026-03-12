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
        VStack(alignment: .leading, spacing: 20) {
            // Top pill
            Text("Ongoing")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color.white.opacity(0.12))
                .clipShape(Capsule())
                .frame(maxWidth: .infinity, alignment: .center)

            VStack(spacing: 4) {
                            Text("\(minutes)")
                                .font(.system(size: 64, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text("Minutes Wait")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.white)
                            
                            Text("Estimated time until your Vitals check begins.")
                                .font(.system(size: 13))
                                .foregroundColor(.white.opacity(0.9))
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity)

            HStack(spacing: 12) {
                Button(action: {
                    onCancel?()
                }) {
                    Text("Cancel Appointment")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(Color(#colorLiteral(red: 0.0, green: 0.404, blue: 1.0, alpha: 1.0)))
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
        .padding(16)
        .background(Color(#colorLiteral(red: 0.0, green: 0.4, blue: 1.0, alpha: 1.0)))
        .cornerRadius(20)
        .padding(.horizontal, 16) 
    }
}

#Preview {
    WaitTimeCardView(minutes: 15)
        .previewLayout(.sizeThatFits)
        .padding()
}

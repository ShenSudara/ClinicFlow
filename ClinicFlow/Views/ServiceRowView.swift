//
//  ServiceRowView.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-001 on 2026-03-12.
//

import SwiftUI

struct ServiceRowView: View {
    let item: ServiceItem
    var isLast: Bool = false

    var rowContent: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .center, spacing: 0) {
                Circle()
                    .fill(item.status.iconCircleColor)
                    .frame(width: 32, height: 32)
                    .overlay(
                        Group {
                            if item.status == .completed {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .bold))
                            } else {
                                Image(systemName: item.type.iconName)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                            }
                        }
                    )
                if !isLast {
                    Rectangle()
                        .fill(Color.blue.opacity(0.4))
                        .frame(width: 2)
                        .padding(.top, 6)
                        .overlay(
                            VStack {
                                ForEach(0..<20) { _ in
                                    Rectangle()
                                        .fill(Color.clear)
                                        .frame(height: 6)
                                }
                            }
                        )
                        .opacity(0.6)
                        .frame(maxHeight: .infinity)
                } else {
                    Spacer().frame(height: 0)
                }
            }
            .frame(width: 40)

            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(item.serviceName)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.primary)
                    Spacer()
                    Text(item.status.rawValue.capitalized)
                        .font(.system(size: 12, weight: .bold))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(item.status.borderColor.opacity(0.12))
                        .foregroundColor(item.status.borderColor)
                        .cornerRadius(10)
                }
                Text(item.room)
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                HStack(spacing: 8) {
                    Image(systemName: "clock")
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                    Text(item.time)
                        .font(.system(size: 13))
                        .foregroundColor(.secondary)
                }
            }
            .padding(12)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(item.status.borderColor.opacity(0.3), lineWidth: 1)
            )
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.02), radius: 4, x: 0, y: 2)
        }
        .padding(.vertical, 6)
    }

    var body: some View {
        if item.type == .payment || item.type == .pharmacy {
            NavigationLink(destination: PaymentView().environmentObject(AppViewModel())) {
                rowContent
            }
            .buttonStyle(PlainButtonStyle())
        } else {
            NavigationLink(destination: ServiceDetailsView(service: item)) {
                rowContent
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

#Preview {
    VStack(spacing: 12) {
        ServiceRowView(item: ServiceItem(serviceName: "Consultation", status: .completed, room: "Room 302", time: "8:30 AM", type: .doctor))
        ServiceRowView(item: ServiceItem(serviceName: "Blood Test", status: .ongoing, room: "Room 302", time: "8:40 AM", type: .syringe))
        ServiceRowView(item: ServiceItem(serviceName: "Pharmacy", status: .pending, room: "Pharmacy", time: "9:30 AM", type: .payment))
    }
    .padding()
    .background(Color("Background"))
    .environmentObject(AppViewModel())
}

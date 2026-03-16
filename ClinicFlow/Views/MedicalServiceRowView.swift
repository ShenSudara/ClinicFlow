//
//  MedicalServiceRowView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-13.
//

import SwiftUI

struct MedicalServiceRowView: View {
    var iconName: String
    var iconBg: Color
    var title: String
    var subtitle: String

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(iconBg.opacity(0.15))
                    .frame(width: 44, height: 44)
                Image(systemName: iconName)
                    .foregroundColor(iconBg)
            }
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

struct MedicalServiceRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MedicalServiceRowView(iconName: "drop.fill", iconBg: .red, title: "Blood Test", subtitle: "Rs. 800")
            MedicalServiceRowView(iconName: "bag.fill", iconBg: .blue, title: "Pharmacy", subtitle: "Rs. 1200")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

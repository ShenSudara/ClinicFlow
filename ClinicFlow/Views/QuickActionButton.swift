//
//  QuickActionButton.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-12.
//

import SwiftUI

struct QuickActionButton: View {
    let action: () -> Void
    let actionModel: QuickAction
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                ZStack {
                    Circle()
                        .fill(actionModel.color.opacity(0.12))
                        .frame(width: 56, height: 56)
                    Image(systemName: actionModel.systemIcon)
                        .font(.system(size: 22))
                        .foregroundColor(actionModel.color)
                }
                Text(actionModel.title)
                    .font(.system(size: 14, weight: .bold))
                    .headerColor()
            }
            .frame(minWidth: 80)
        }
        .buttonStyle(PlainButtonStyle())
        .accessibilityLabel(actionModel.title)
        .accessibilityHint("Tap to \(actionModel.title)")
    }
}

#Preview {
    QuickActionButton(action: {}, actionModel: QuickAction(title: "Book Now", systemIcon: "calendar.badge.plus", color: .blue))
}

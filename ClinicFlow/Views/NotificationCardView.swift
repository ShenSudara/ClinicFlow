//
//  NotificationCardView.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-12.
//

import SwiftUI

struct NotificationCardView: View {
    let item: NotificationItem
    let onTap: ((NotificationItem) -> Void)?
    
    var body: some View {
        Button(action: {
            onTap?(item)
        }) {
            HStack(alignment: .center, spacing: 12) {
                if item.isUnread {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 10, height: 10)
                        .accessibilityHidden(true)
                } else {
                    Spacer().frame(width: 10)
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(item.type.backgroundColor)
                        .frame(width: 40, height: 40)
                    Image(systemName: item.type.iconName)
                        .font(.system(size: 18))
                        .foregroundColor(item.type.foregroundColor)
                }
                .accessibilityHidden(true)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack(alignment: .top) {
                        Text(item.title)
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.primary)
                            .lineLimit(1)
                        Spacer()
                        Text(item.timeText)
                            .font(.system(size: 12))
                            .foregroundColor(Color("SubHeader2"))
                    }
                    Text(item.description)
                        .font(.system(size: 14))
                        .foregroundColor(Color("SubHeader2"))
                        .lineLimit(2)
                }
            }
            .padding(12)
            .padding(.vertical, 5)
            .background(Color("Background"))
            .overlay(
                Rectangle()
                    .frame(height: 0.2)
                    .foregroundColor(Color("NPrimaryColor").opacity(0.3)),
                alignment: .bottom
            )
        }
        .buttonStyle(PlainButtonStyle())
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(item.title). \(item.description)")
        .accessibilityHint(item.timeText)
    }
}

#Preview {
    VStack(spacing: 0){
        NotificationCardView(item: NotificationItem(type: .turn, title: "Your turn is next", description: "Please proceed to Room 202.", timeText: "now", date: Date(), section: .today, isUnread: true), onTap: { _ in })
        NotificationCardView(item: NotificationItem(type: .payment, title: "Payment Successful", description: "Your payment of Rs. 2000.00 has been processed.", timeText: "1h ago", date: Date(), section: .today, isUnread: false), onTap: { _ in })
    }
    .background(Color("Background"))
}

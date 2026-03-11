//
//  NotificationRow.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-11.
//

import SwiftUI

struct NotificationRow: View {
    let notification: NotificationItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 12)
                .fill(notification.iconColor.opacity(0.1))
                .frame(width: 50, height: 50)
            
            Image(systemName: notification.iconName)
                .foregroundColor(notification.iconColor)
                .font(.system(size: 20))
                .frame(width: 50, height: 50)
            
            if notification.isUnread {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 10, height: 10)
                    .offset(x: -18, y: -20)
            }
        }
        
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(notification.title)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color("Header"))
                Spacer()
                Text(notification.timeAgo)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            
            Text(notification.description)
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .lineLimit(2)
        }
    }
        
                .padding(.vertical, 8)
            }
        }

//
//  CustomTabBar.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-10.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: MainTab
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            HStack {
                TabButton(tab: .home, label: "Home", icon: "house", selectedTab: $selectedTab)
                TabButton(tab: .appointments, label: "Appointments", icon: "calendar.badge.clock", selectedTab: $selectedTab)
                TabButton(tab: .notifications, label: "Notifications", icon: "bell", selectedTab: $selectedTab)
                TabButton(tab: .profile, label: "Profile", icon: "person.circle", selectedTab: $selectedTab)
            }
            .padding(.top, 10)
            .padding(.bottom, 25)
            .background(Color.white)
        }
    }
}

struct TabButton: View {
    let tab: MainTab
    let label: String
    let icon: String
    @Binding var selectedTab: MainTab
    
    var isSelected: Bool { selectedTab == tab }
    
    var body: some View {
        Button {
            selectedTab = tab
        } label: {
            VStack(spacing: 4) {
                Image(systemName: isSelected ? icon + "" : icon)
                    .font(.system(size: 22))
                    .frame(height: 26)
                
                Text(label)
                    .font(.system(size: 12, weight: isSelected ? .bold : .medium))
            }
            
            .foregroundColor(isSelected ? Color("NPrimaryColor") : Color.gray.opacity(0.6))
            .frame(maxWidth: .infinity)
            .animation(.none, value: isSelected)
        }
    }
}

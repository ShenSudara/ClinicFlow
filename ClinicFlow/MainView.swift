//
//  MainView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-02.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab: MainTab = .appointments
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                // 1. Header
                MainHeader(title: "Appointments", profileImageName: "UserAvatar")
                
                // 2. Main Content Area
                ScrollView {
                    VStack(spacing: 20) {
                        AppointmentListView()
                    }
                    .padding(.top, 20)
                }
                .background(Color("Background").opacity(0.4))
                
                // 3. Bottom Tab Bar
                CustomTabBar(selectedTab: $selectedTab)
            }
            
            // 4. Floating Action Button
            Button {
                // Action to add new appointment
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 65, height: 65)
                    .background(Color("NPrimaryColor"))
                    .clipShape(Circle())
                    .shadow(color: Color("NPrimaryColor").opacity(0.4), radius: 10, x: 0, y: 5)
            }
            .padding(.bottom, 90)
            .padding(.trailing, 25)
            .frame(maxWidth: .infinity, alignment: .bottomTrailing)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

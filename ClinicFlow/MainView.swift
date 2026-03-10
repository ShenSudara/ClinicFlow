//
//  MainView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-02.
//

import SwiftUI

struct MainView: View {
        @State private var selectedTab: MainTab = .appointments
        @State private var filterSelection: AppointmentFilter = .upcoming
        @State private var searchText: String = ""
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                
                MainHeader(title: "Appointments", profileImageName: "UserAvatar")
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search doctor or clinic", text: $searchText)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                .padding(.horizontal, 20)
                .padding(.vertical, 15)
                
                AppointmentSegmentPicker(selection: $filterSelection)
                                    .padding(.bottom, 15)
                
                ScrollView {
                                    VStack(alignment: .leading, spacing: 15) {
                                        Text("Today")
                                            .font(.system(size: 16, weight: .semibold))
                                            .foregroundColor(.gray)
                                            .padding(.horizontal, 20)
                                        
                                        // Example Cards
                                        AppointmentCard(
                                            doctorName: "Dr. Ashen Sudaraka",
                                            department: "General Checkup",
                                            time: "10:30 AM",
                                            dateDay: "10",
                                            dateMonth: "MAR",
                                            status: "Pending",
                                            statusColor: .orange
                                        )
                                        
                                        AppointmentCard(
                                            doctorName: "Dr. Shanel Perera",
                                            department: "Cardiology Clinic",
                                            time: "12:30 PM",
                                            dateDay: "10",
                                            dateMonth: "MAR",
                                            status: "Ongoing",
                                            statusColor: .green
                                        )
                                    }
                                    .padding(.top, 10)
                                    .padding(.bottom, 120)
                                }
        
                                CustomTabBar(selectedTab: $selectedTab)
                            }
                            
                            Button(action: { /* Navigate to Book Appt */ }) {
                                Image(systemName: "plus")
                                    .font(.system(size: 30, weight: .bold))
                                    .foregroundColor(.white)
                                    .frame(width: 60, height: 60)
                                    .background(Color("NPrimaryColor"))
                                    .clipShape(Circle())
                                    .shadow(radius: 5)
                            }
                            .padding(.bottom, 100)
                            .padding(.trailing, 25)
                            .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                        }
                        .edgesIgnoringSafeArea(.bottom)
                        .commonBackground()
                    }
                }

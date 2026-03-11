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
    
    @State private var appointments = [
        Appointment(doctorName: "Dr. Nadu Sharindi", clinicName: "General Checkup", time: "10:30 AM", day: "19", month: "MAR", filterStatus: .upcoming, displayStatus: "Pending", color: .orange),
        Appointment(doctorName: "Dr. Kasun Tharaka", clinicName: "General Checkup", time: "11:30 AM", day: "12", month: "MAR", filterStatus: .upcoming, displayStatus: "Pending", color: .blue),
        Appointment(doctorName: "Dr. Nadu Sharindi", clinicName: "General Checkup", time: "10:30 AM", day: "18", month: "MAR", filterStatus: .upcoming, displayStatus: "Pending", color: .yellow),
        Appointment(doctorName: "Dr. Sithu Perera", clinicName: "Cardiology Clinic", time: "12:30 PM", day: "10", month: "MAR", filterStatus: .upcoming, displayStatus: "Ongoing", color: .green),
        Appointment(doctorName: "Dr. Shanel Perera", clinicName: "Cardiology Clinic", time: "12:30 PM", day: "10", month: "MAR", filterStatus: .upcoming, displayStatus: "Ongoing", color: .purple),
        
        Appointment(doctorName: "Dr. Shen Sliva", clinicName: "Dental", time: "09:00 AM", day: "08", month: "MAR", filterStatus: .past, displayStatus: "Completed", color: .gray),
        Appointment(doctorName: "Dr. Shen Sliva", clinicName: "Dental", time: "09:00 AM", day: "08", month: "MAR", filterStatus: .past, displayStatus: "Completed", color: .gray),
        Appointment(doctorName: "Dr. Shen Sliva", clinicName: "Dental", time: "09:00 AM", day: "08", month: "MAR", filterStatus: .past, displayStatus: "Completed", color: .gray),
        Appointment(doctorName: "Dr. Shen Sliva", clinicName: "Dental", time: "09:00 AM", day: "08", month: "MAR", filterStatus: .past, displayStatus: "Completed", color: .gray),
        Appointment(doctorName: "Dr. Shen Sliva", clinicName: "Dental", time: "09:00 AM", day: "08", month: "MAR", filterStatus: .past, displayStatus: "Completed", color: .gray),
        Appointment(doctorName: "Dr. Shen Sliva", clinicName: "Dental", time: "09:00 AM", day: "08", month: "MAR", filterStatus: .past, displayStatus: "Completed", color: .gray),
        
        Appointment(doctorName: "Dr. Nadu Sharindi", clinicName: "General Checkup", time: "02:00 PM", day: "05", month: "MAR", filterStatus: .cancelled, displayStatus: "Cancelled", color: .red),
        Appointment(doctorName: "Dr. Nadu Sharindi", clinicName: "General Checkup", time: "02:00 PM", day: "05", month: "MAR", filterStatus: .cancelled, displayStatus: "Cancelled", color: .red),
        Appointment(doctorName: "Dr. Nadu Sharindi", clinicName: "General Checkup", time: "02:00 PM", day: "05", month: "MAR", filterStatus: .cancelled, displayStatus: "Cancelled", color: .red),
        Appointment(doctorName: "Dr. Nadu Sharindi", clinicName: "General Checkup", time: "02:00 PM", day: "05", month: "MAR", filterStatus: .cancelled, displayStatus: "Cancelled", color: .red)
    ]
    
    var filteredAppointments: [Appointment] {
        appointments.filter { appt in
            let matchesSegment = appt.filterStatus == filterSelection
            let matchesSearch = searchText.isEmpty ||
            appt.doctorName.localizedCaseInsensitiveContains(searchText) ||
            appt.clinicName.localizedCaseInsensitiveContains(searchText)
            
            return matchesSegment && matchesSearch
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                
                switch selectedTab {
                case .home:
                    HomeView()
                case .appointments:
                    appointmentListView
                case .notifications:
                    NotificationsView()
                case .profile:
                    Text("Profile Content")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
                CustomTabBar(selectedTab: $selectedTab)
            }
            
            if selectedTab == .appointments {
                Button(action: {}) {
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
                .transition(.scale.combined(with: .opacity))
                .frame(maxWidth: .infinity, alignment: .bottomTrailing)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .commonBackground()
    }
    
    private var appointmentListView: some View {
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
                        if filteredAppointments.isEmpty {
                            ContentUnavailableView("No Appointments", systemImage: "calendar.badge.exclamationmark", description: Text("No results found for '\(searchText)'"))
                                .padding(.top, 50)
                        } else {
                            Text(filterSelection == .upcoming ? "Today" : filterSelection.rawValue)
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.gray)
                                .padding(.horizontal, 20)
                            
                            ForEach(filteredAppointments) { appt in
                                AppointmentCard(
                                    doctorName: appt.doctorName,
                                    department: appt.clinicName,
                                    time: appt.time,
                                    dateDay: appt.day,
                                    dateMonth: appt.month,
                                    status: appt.displayStatus,
                                    statusColor: appt.color
                                )
                            }
                        }
                    }
                    .padding(.bottom, 120)
                }
            }
        }
    }

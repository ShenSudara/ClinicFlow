//
//  HomeScrollableView.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-001 on 2026-03-10.
//

import SwiftUI
struct HomeScrollableView: View {
    @EnvironmentObject var patientViewModel: PatientViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 25) {
                
                // Greeting
                VStack(alignment: .leading, spacing: 4) {
                    Text("Good morning, Ashen")
                        .headerColor()
                        .font(.system(size: 28, weight: .bold))
                    Text("How are you feeling today?")
                        .subHeader2Color()
                        .font(.system(size: 16))
                }
                
                //Mood Selector
                MoodGridView()
                
                //Upcoming appointments
                VStack(spacing: 15) {
                    SectionHeader(title: "Upcoming Appointments", actionText: "See all")
                    
                    AppointmentCard(
                        name: "Dr. Ashen Sudaraka",
                        type: "General Checkup",
                        date: "MAR 10",
                        time: "10:30 AM",
                        status: "Pending",
                        statusColor: .orange
                    )
                    
                    AppointmentCard(
                        name: "Dr. Shanel Perera",
                        type: "Cardiology Clinic",
                        date: "MAR 10",
                        time: "12:30 AM",
                        status: "Ongoing",
                        statusColor: .green
                    )
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    SectionHeader(title: "Quick Actions")
                    QuichActionsRow()
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    SectionHeader(title: "Health Insights")
                    HealthInsightsRow()
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    SectionHeader(title: "Recent Clinics", actionText: "See all")
                    
                }
                
                
            }
            .commonPadding()
            .padding(.top, 20)
            .padding(.bottom, 30)
        }
        .commonLayout()
        .commonBackground()
    }
    
}

//Mood selection
struct MoodGridView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyGrid(columns: columns, spacing: 15) {
            MoodItem(emoji: "", label: "Good", color: .green)
            MoodItem(emoji: "", label: "OK", color: .blue)
            MoodItem(emoji: "", label: "Not Well", color: .orange)
            MoodItem(emoji: "", label: "Urgent Help", color: .red)
        }
    }
}

struct MoodItem: View {
    let emogi: String
    let label: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 10) {
            Text(emoji)
                .font(.system(size: 32))
            Text(label)
                .headerColor()
                .font(.system(size: 16, weight: .medium))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 5, X: 0, Y: 5)
    }
}

#Preview {
    HomeScrollableView()
}

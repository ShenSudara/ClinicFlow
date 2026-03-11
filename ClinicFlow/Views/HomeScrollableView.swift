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
                
                //Greeting
                VStack(alignment: .leading, spacing: 4) {
                    Text("Good morning, Ashen")
                        .headerColor()
                        .font(.system(size: 28, weight: .bold))
                    Text("How are you feeling today?")
                        .subHeader2Color()
                        .font(.system(size: 16))
                }
                //Mood Selection
                MoodGridView()
                
                //Upcoming Appointments
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
                
                //Quick Actions
                VStack(alignment: .leading, spacing: 15) {
                    SectionHeader(title: "Quick Actions")
                    QuickActionsRow()
                }
                                
                //Health Insights
                VStack(alignment: .leading, spacing: 15) {
                    SectionHeader(title: "Health Insights")
                    HealthInsightsRow()
                }
                
               //Recent Clinics
                VStack(alignment: .leading, spacing: 15) {
                    SectionHeader(title: "Recent Clinics", actionText: "See all")
                    RecentClinicsRow()
                }
            }
            .commonPadding()
            .padding(.top, 20)
            .padding(.bottom, 100)
        }
        .commonLayout()
        .commonBackground()
    }
}
                    
                    
                    //Section Header
                    struct SectionHeader: View {
                        let title: String
                        var actionText: String? = nil
                        
                        var body: some View {
                            HStack {
                                Text(title)
                                    .headerColor()
                                    .font(.system(size: 18, weight: .bold))
                                Spacer()
                                if let action = actionText {
                                    Button(action: {}) {
                                        Text(action)
                                            .font(.system(size: 14, weight: .medium))
                                            .primaryColor()
                                    }
                                }
                            }
                        }
                    }
                    
                    //Mood Content
                    struct MoodGridView: View {
                        let columns = [GridItem(.flexible()), GridItem(.flexible())]
                        
                        var body: some View {
                            LazyVGrid(columns: columns, spacing: 15) {
                                MoodItem(iconName: "face.smiling.fill", label: "Good", color: .green)
                                MoodItem(iconName: "face.dashed.fill", label: "Ok", color: .blue)
                                MoodItem(iconName: "face.frowning.fill", label: "Not Well", color: .orange)
                                MoodItem(iconName: "exclamationmark.diamond.fill", label: "Urgent Help", color: .red, hasBorder: true)
                            }
                        }
                    }
                    
                    //mood card style
                    struct MoodItem: View {
                        let iconName: String
                        let label: String
                        let color: Color
                        var hasBorder: Bool = false
                        
                        var body: some View {
                            VStack(spacing: 15) {
                                ZStack {
                                   Circle()
                                   .fill(color.opacity(0.08))
                                    .frame(width: 60, height: 60)
                                            
                                    Image(systemName: iconName)
                                            .font(.system(size: 32, weight: .medium))
                                            .foregroundColor(color)
                                    }
                                            
                                    Text(label)
                                        .font(.system(size: 16, weight: .bold))
                                            .headerColor()
                                    }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 25)
                            .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.white)
                                            .overlay(
                                                // Only adds the red border for "Urgent Help"
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(color.opacity(hasBorder ? 0.2 : 0), lineWidth: 1.5)
                                            )
                                    )
                            .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 4)
                        }
                    }
                    
                    
                    
                    //Appointment Card
                    struct AppointmentCard: View {
                        let name: String
                        let type: String
                        let date: String
                        let time: String
                        let status: String
                        let statusColor: Color
                        
                        var body: some View {
                            HStack(spacing: 15) {
                                VStack {
                                    Text(date.prefix(3))
                                        .font(.system(size: 12, weight: .bold))
                                        .primaryColor()
                                    Text(date.suffix(2))
                                        .font(.system(size: 18, weight: .bold))
                                        .primaryColor()
                                }
                                
                                .frame(width: 50, height: 60)
                                .background(Color("NPrimaryColor").opacity(0.1))
                                .cornerRadius(10)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    HStack {
                                        Text(name).font(.system(size: 16, weight: .bold))
                                        Spacer()
                                        Text(time).font(.system(size: 12)).subHeader2Color()
                                    }
                                    Text(type).font(.system(size: 14)).subHeader2Color()
                                    
                                    Text(status)
                                        .font(.system(size: 10, weight: .bold))
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(statusColor.opacity(0.1))
                                        .foregroundColor(statusColor)
                                        .cornerRadius(5)
                                }
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("SubHeader2"))
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                        }
                    }
                    
                    //Quick Actions
                    struct QuickActionsRow: View {
                        var body: some View {
                            HStack(spacing: 20) {
                                ActionItem(icon: "calendar.badge.plus", label: "Book Now", color: .blue)
                                ActionItem(icon: "mappin.and.ellipse", label: "Clinics", color: .green)
                                ActionItem(icon: "video", label: "Tele Health", color: .yellow)
                                ActionItem(icon: "phone", label: "Contact", color: .orange)
                            }
                        }
                    }
                    
                    
                    struct ActionItem: View {
                        let icon: String
                        let label: String
                        let color: Color
                        
                        var body: some View {
                            VStack(spacing: 8) {
                                ZStack {
                                    Circle()
                                        .fill(color.opacity(0.1))
                                        .frame(width: 50, height: 50)
                                    Image(systemName: icon)
                                        .foregroundColor(color)
                                        .font(.system(size: 20))
                                }
                                Text(label)
                                    .font(.system(size: 12, weight: .medium))
                                    .headerColor()
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    
                    //Insight section
                    struct HealthInsightsRow: View {
                        var body: some View {
                            HStack(spacing: 15) {
                                InsightCard(title: "Daily Steps", value: "8,432", goal: "/ 10k", icon: "figure.walk", progress: 0.84, color: .blue)
                                InsightCard(title: "Heart Rate", value: "72", goal: "BPM", icon: "heart.fill", progress: nil, color: .red)
                            }
                        }
                    }
                    
                    
                    struct InsightCard: View {
                        let title: String
                        let value: String
                        let goal: String
                        let icon: String
                        let progress: Double?
                        let color: Color
                        
                        var body: some View {
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Image(systemName: icon)
                                        .foregroundColor(color)
                                    Spacer()
                                    Text(title).font(.system(size: 12)).subHeader2Color()
                                }
                                
                                HStack(alignment: .bottom, spacing: 2) {
                                    Text(value).font(.system(size: 20, weight: .bold))
                                    Text(goal).font(.system(size: 12)).subHeader2Color().padding(.bottom, 2)
                                }
                                
                                if let p = progress {
                                    ZStack(alignment: .leading) {
                                        Capsule().fill(Color.gray.opacity(0.1)).frame(height: 6)
                                        Capsule().fill(color).frame(width: 100 * CGFloat(p), height: 6)
                                    }
                                } else {
                                    // Heart rate graph placeholder
                                    HStack(alignment: .bottom, spacing: 3) {
                                        ForEach(0..<6) { _ in
                                            RoundedRectangle(cornerRadius: 2)
                                                .fill(color.opacity(0.5))
                                                .frame(width: 4, height: CGFloat.random(in: 10...25))
                                        }
                                    }
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                        }
                    }
                    
                    struct RecentClinicsRow: View {
                        var body: some View {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ClinicCard()
                                    ClinicCard()
                                }
                            }
                        }
                    }
                    
                    
                    //Clinics Section
                    struct ClinicCard: View {
                        var body: some View {
                            VStack(alignment: .leading) {
                                Image("ClinicImage") // Replace with actual clinic image if available
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200, height: 100)
                                    .clipped()
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Cardiology Clinic")
                                        .font(.system(size: 16, weight: .bold))
                                    Text("Dr. Naduni Perera")
                                        .font(.system(size: 12))
                                        .subHeader2Color()
                                    
                                    Button(action: {}) {
                                        HStack {
                                            Image(systemName: "calendar")
                                            Text("Wed, Oct 24")
                                        }
                                        .font(.system(size: 12, weight: .bold))
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 8)
                                        .background(Color("NPrimaryColor"))
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                    }
                                    .padding(.top, 5)
                                }
                                .padding()
                            }
                            .frame(width: 200)
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                        }
                    }

                    #Preview {
                        HomeScrollableView()
                            .environmentObject(PatientViewModel())
                    }
                    

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
                                MoodItem(emoji: "😊", label: "Good", color: .green)
                                MoodItem(emoji: "😐", label: "Ok", color: .blue)
                                MoodItem(emoji: "🙁", label: "Not Well", color: .orange)
                                MoodItem(emoji: "🚨", label: "Urgent Help", color: .red)
                            }
                        }
                    }

                    //mood card style
                    struct MoodItem: View {
                        let emoji: String
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
                            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
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

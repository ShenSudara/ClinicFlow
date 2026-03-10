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

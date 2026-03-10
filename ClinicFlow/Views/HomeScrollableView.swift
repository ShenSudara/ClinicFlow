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

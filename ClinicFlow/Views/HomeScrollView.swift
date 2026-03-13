//
//  HomeScrollView.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-12.
//

import SwiftUI

struct HomeScrollView: View {
    @StateObject var vm: HomeViewModel
    @EnvironmentObject private var appViewModel: AppViewModel
    @EnvironmentObject private var patientViewModel: PatientViewModel

    init(vm: HomeViewModel = HomeViewModel()) {
        _vm = StateObject(wrappedValue: vm)
    }

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 30) {
                    Text("Good morning, \(vm.userName)")
                        .font(.system(size: 30, weight: .bold))
                        .headerColor()
                        .padding(.top, 30)

                    if let next = vm.nextAppointments.first {
                        Button(action: { appViewModel.selectedTab = 1 }) {
                            NextAppointmentCard(appointment: next, minutes: vm.nextAppointmentCountdown(for: next))
                        }
                        .buttonStyle(PlainButtonStyle())
                    }

                    if vm.showFeelingSection {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("How are you feeling today?")
                                .headerColor()
                                .font(.system(size: 18, weight: .bold))
                            VStack { FeelingCardGrid(vm: vm) }
                                .padding(.top, 15)
                        }
                        .padding(.top, 16)
                        .padding(.bottom, 15)
                    }

                    VStack(alignment: .leading, spacing: 30) {
                        HStack {
                            Text("Upcoming Appointments")
                                .font(.system(size: 18, weight: .bold))
                                .headerColor()
                            Spacer()
                            Button(action: { appViewModel.selectedTab = 1 }) {
                                Text("See all").primaryColor()
                            }
                        }

                        VStack(spacing: 15) {
                            ForEach(vm.upcomingAppointmentsLimited) { appt in
                                Button(action: { appViewModel.selectedTab = 1 }) {
                                    AppointmentRowView(appointment: appt)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    .padding(.bottom, 15)

                    VStack(alignment: .leading, spacing: 30) {
                        Text("Quick Actions")
                            .font(.system(size: 18, weight: .bold))
                            .headerColor()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(vm.quickActions) { qa in
                                    QuickActionButton(action: {}, actionModel: qa)
                                }
                            }
                        }
                    }
                    .padding(.bottom, 15)

                    VStack(alignment: .leading, spacing: 30) {
                        Text("Health Insights")
                            .font(.system(size: 18, weight: .bold))
                            .headerColor()
                        HStack(spacing: 12) {
                            ForEach(vm.insights) { insight in
                                HealthInsightCard(insight: insight)
                            }
                        }
                    }
                    .padding(.bottom, 15)

                    VStack(alignment: .leading, spacing: 30) {
                        HStack {
                            Text("Recent Clinics")
                                .font(.system(size: 18, weight: .bold))
                                .headerColor()
                            Spacer()
                            Button(action: {}) {
                                Text("See all").primaryColor()
                            }
                        }

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(vm.clinics) { clinic in
                                    ClinicCardView(clinic: clinic)
                                }
                            }
                        }
                    }
                }
            }
            .commonBackground()
            .commonLayout()
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeScrollView(vm: HomeViewModel(sampleToday: true))
        .environmentObject(AppViewModel())
        .environmentObject(PatientViewModel())
}

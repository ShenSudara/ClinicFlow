//
//  AppointmentDetailsView.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-001 on 2026-03-12.
//

import SwiftUI

struct AppointmentDetailsView: View {
    @StateObject private var serviceVM = ServiceViewModel()
    @EnvironmentObject var patientViewModel: PatientViewModel
    var body: some View {
            VStack(alignment: .leading, spacing: 12) {
                TabHeader(title: "Appointment Details", isHome: false)
                    .padding(.horizontal, 16)
                    .padding(.top, 10)

                // Wait Time Card inserted here
                WaitTimeCardView(minutes: 15, onCancel: {
                    
                })

                // Services section title
                Text("Services")
                    .font(.system(size: 18, weight: .bold))
                    .headerColor()
                    .padding(.horizontal, 16)
                    .padding(.top, 8)

                // Services timeline
                ServiceTimelineView(vm: serviceVM)
                    .frame(maxWidth: .infinity)

                Spacer()
            }
            .commonBackground()
            .commonLayout()
        }
    }

    #Preview {
        AppointmentDetailsView().environmentObject(PatientViewModel())
    }

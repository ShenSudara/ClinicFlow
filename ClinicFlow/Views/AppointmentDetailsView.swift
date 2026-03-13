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
        VStack(alignment: .leading) {
            AppHeader(title: "Appointment Details", showBackButton: true)
                .padding(.bottom, 15)

            WaitTimeCardView(minutes: 15, onCancel: {
            }).padding(.bottom, 15)

            Text("Services")
                .font(.system(size: 18, weight: .bold))
                .headerColor()

            ServiceTimelineView(vm: serviceVM)
                .frame(maxWidth: .infinity)

            Spacer()
        }
        .commonPadding()
        .commonBackground()
        .commonLayout()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        AppointmentDetailsView().environmentObject(PatientViewModel())
    }
}

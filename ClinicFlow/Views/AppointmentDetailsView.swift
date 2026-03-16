//
//  AppointmentDetailsView.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-001 on 2026-03-12.
//

import SwiftUI

struct AppointmentDetailsView: View {
    var appointment: AppointmentModel?
    @StateObject private var serviceVM = ServiceViewModel()
    @EnvironmentObject var patientViewModel: PatientViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment: .leading) {
                AppHeader(title: "Appointment Details", showBackButton: true, backAction: { dismiss() })
                    .padding(.bottom, 15)

                WaitTimeCardView(minutes: 15, onCancel: {})
                    .padding(.bottom, 15)

                Text("Services")
                    .font(.system(size: 18, weight: .bold))
                    .headerColor()

                ServiceTimelineView(vm: serviceVM, onSelect: { service in
                    path.append(service)
                })
                .frame(maxWidth: .infinity)

                Spacer()
            }
            .commonPadding()
            .commonBackground()
            .commonLayout()
            .navigationDestination(for: ServiceItem.self) { service in
                if service.type == .payment{
                    PaymentView()
                } else {
                    ServiceDetailsView(service: service)
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    NavigationStack {
        AppointmentDetailsView(appointment: AppointmentModel(doctorName: "Dr Test", specialty: "General", date: Date(), time: "10:00 AM", status: .pending))
            .environmentObject(PatientViewModel())
    }
}

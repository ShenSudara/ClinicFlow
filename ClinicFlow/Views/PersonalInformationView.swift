//
//  PersonalInformationView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-12.
//

import SwiftUI

struct PersonalInformationView: View {
    @EnvironmentObject var patientViewModel: PatientViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            AppHeader(title: "Update Profile", showBackButton: true)
            
            VStack(spacing: 20) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color("NPrimaryColor"))
                Button("Edit Photo") {
                }
                .foregroundColor(Color("NPrimaryColor"))
                VStack(alignment: .leading, spacing: 12) {
                    Text("PERSONAL DETAILS").subHeader2Color().font(.system(size: 14, weight: .regular))
                    VStack {
                        ProfileTextField(label: "Full Name", placeholder: "Patient Name", text: Binding(
                            get: { patientViewModel.patient.name ?? "" },
                            set: { patientViewModel.patient.name = $0 }
                        ))
                        Divider()
                        ProfileTextField(label: "NIC Number", placeholder: "XXXXXXXXXXXXX", text: Binding(
                            get: { patientViewModel.patient.nicNumber ?? "" },
                            set: { patientViewModel.patient.nicNumber = $0 }
                        ))
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("CONTACT INFORMATION").subHeader2Color().font(.system(size: 14, weight: .regular))
                    VStack {
                        ProfileTextField(label: "Mobile No", placeholder: "0XXXXXXXXX", text: $patientViewModel.patient.mobileNo)
                        Divider()
                        ProfileTextField(label: "Email", placeholder: "example@mail.com", text: Binding(
                            get: { patientViewModel.patient.email ?? "" },
                            set: { patientViewModel.patient.email = $0 }
                        ))
                        Divider()
                        ProfileTextField(label: "Address", placeholder: "Example Address", text: Binding(
                            get: { patientViewModel.patient.address ?? "" },
                            set: { patientViewModel.patient.address = $0 }
                        ))
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                }
                Spacer()
            }.padding(.vertical, 15)
        }
        .commonPadding()
        .commonLayout()
        .commonBackground()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    PersonalInformationView().environmentObject(PatientViewModel())
}

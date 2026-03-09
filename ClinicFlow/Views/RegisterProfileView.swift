//
//  RegisterProfileView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-01.
//

import SwiftUI

struct RegisterProfileView: View {
    @Binding var path: NavigationPath
    @EnvironmentObject var patientViewModel: PatientViewModel
    @State private var fullName: String = ""
    
    var body: some View {
        VStack{
            AppHeader(title:"Set Up Profile", showBackButton: true, backAction: {
                patientViewModel.signOut()
                path.removeLast(path.count)
            })
            
            HStack{
                Button {
                } label: {
                    Image("EditProfileIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
            }.padding(.vertical, 25)
            
            VStack(spacing: 30){
                VStack(alignment: .leading, spacing: 15){
                    Text("PERSONAL DETAILS").subHeader2Color().font(.system(size: 14, weight: .regular))
                    VStack{
                        ProfileTextField(
                            label: "Full Name", placeholder: "Ashen Sudaraka", text: Binding(
                                get: { patientViewModel.patient.name ?? "" },
                                set: { patientViewModel.patient.name = $0 }
                            )
                        ).overlay(
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color("IconBackground")),
                            alignment: .bottom
                        )
                        ProfileTextField(
                            label: "NIC Number", placeholder: "XXXXXXXXXXXX", text: Binding(
                                get: { patientViewModel.patient.nicNumber ?? "" },
                                set: { patientViewModel.patient.nicNumber = $0 }
                            )
                        )
                    }
                    .background(.white)
                    .cornerRadius(10)
                }
                
                VStack(alignment: .leading, spacing: 15){
                    Text("CONTACT INFORMATION").subHeader2Color().font(.system(size: 14, weight: .regular))
                    VStack{
                        ProfileTextField(
                            label: "Mobile No", placeholder: "0123456789", text: $patientViewModel.patient.mobileNo
                        ).overlay(
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color("IconBackground")),
                            alignment: .bottom
                        )
                        ProfileTextField(
                            label: "Email", placeholder: "example@example.com", text: Binding(
                                get: { patientViewModel.patient.email ?? "" },
                                set: { patientViewModel.patient.email = $0 }
                            )
                        ).overlay(
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color("IconBackground")),
                            alignment: .bottom
                        )
                        ProfileTextField(
                            label: "Address", placeholder: "Example Address", text: Binding(
                                get: { patientViewModel.patient.address ?? "" },
                                set: { patientViewModel.patient.address = $0 }
                            )
                        )

                    }
                    .background(.white)
                    .cornerRadius(10)
                }
                Spacer()
            }.frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
        }
        .commonLayout()
        .commonPadding()
        .commonBackground()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    RegisterProfileView(path: .constant(NavigationPath())).environmentObject(PatientViewModel())
}

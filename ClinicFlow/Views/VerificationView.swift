//
//  VerificationView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-01.
//

import SwiftUI

struct VerificationView: View {
    @EnvironmentObject var patientViewModel: PatientViewModel
    @Binding var path: NavigationPath

    var body: some View {
        VStack{
            AppHeader(title:"Verify", showBackButton: true)
            HStack{
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75)
            }.frame(maxWidth: .infinity)
                .padding(.top, 40)
            HStack{
                Text("Verification").headerColor()
                    .font(.system(size: 36, weight: .bold))
                    .padding(.bottom, 0.5)
            }
            HStack{
                Text("Enter your verification number sent to 07X XXX XX20")
                    .subHeader2Color()
                    .font(.system(size: 20, weight: .regular))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 25)
                    .padding(.bottom, 15)
            }
            HStack{
                TextField("OTP", text: $patientViewModel.inputOTPCode)
                    .textInputAutocapitalization(.never)
                    .defaultTextField()
                    .padding(.bottom, 25)
            }
            HStack{
                Button("Verify"){
                    guard patientViewModel.verifyOTP() else { return }
                }
                .defaultButton()
                
            }
        }
        .commonPadding()
        .commonLayout()
        .commonBackground()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    VerificationView(path: .constant(NavigationPath())).environmentObject(PatientViewModel())
}

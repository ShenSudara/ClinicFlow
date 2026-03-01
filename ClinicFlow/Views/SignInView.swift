//
//  SignInView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-01.
//

import SwiftUI
import AuthenticationServices

struct SignInView: View {
    @EnvironmentObject var patientViewModel: PatientViewModel

    var body: some View {
        VStack(alignment: .trailing) {
            VStack{
                HStack{
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75)
                }.frame(maxWidth: .infinity)
                HStack{
                    Text("Sign In").headerColor()
                        .font(.system(size: 36, weight: .bold))
                        .padding(.bottom, 0.5)
                }
                HStack{
                    Text("Enter your mobile number to sign in to your account.")
                        .subHeader2Color()
                        .font(.system(size: 20, weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 15)
                }
                HStack{
                    TextField("Mobile Number", text: $patientViewModel.mobileNo)
                        .defaultTextField()
                        .padding(.bottom, 25)
                }
                HStack{
                    Button("Continue"){
                        patientViewModel.sendOTP()
                        print("Test")
                    }
                    .defaultButton()
                    .navigationDestination(isPresented: $patientViewModel.navigateToVerify){
                        VerificationView()
                    }
                    
                }
                HStack{
                    Rectangle()
                        .fill(Color("Icon").opacity(0.5))
                        .frame(height: 1)
                    
                    Text("Or Sign In with")
                        .subHeader2Color()
                        .font(.system(size: 14, weight: .regular))
                        .fixedSize()
                    
                    Rectangle()
                        .fill(Color("Icon").opacity(0.5))
                        .frame(height: 1)
                }.padding(.vertical, 35)
                
                HStack{
                    SignInWithAppleButton(.signIn) { request in
                        print("Apple Sign Up")
                    } onCompletion: { result in
                        print(result)
                    }
                    .signInWithAppleButtonStyle(.black)
                    .frame(height: 50)
                    .cornerRadius(12)
                    .padding(.vertical, 1)
                }
                
                HStack{
                    Button {
                        print("Google Sign In button is clicked")
                    } label: {
                        HStack(spacing: 12) {
                            Image("GoogleIcon")
                                .resizable()
                                .frame(width: 20, height: 20)
                            
                            Text("Sign in with Google")
                        }
                    }
                    .googleButton()
                    .padding(.vertical, 1)
                }
                
                HStack{
                    NavigationLink{
                        SignUpView()
                    } label: {
                        Text("New to Clinic Flow App? Sign Up")
                            .subHeader1Color()
                            .underline()
                    }.padding(.vertical, 35)
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .commonLayout()
        .commonPadding()
        .commonBackground()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    SignInView().environmentObject(PatientViewModel())
}

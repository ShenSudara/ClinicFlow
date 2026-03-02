//
//  SignUpView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-02-28.
//

import SwiftUI
import AuthenticationServices

struct SignUpView: View {
    @EnvironmentObject var patientViewModel: PatientViewModel
    @Binding var path: NavigationPath
    
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
                    Text("Sign Up").headerColor()
                        .font(.system(size: 36, weight: .bold))
                        .padding(.bottom, 0.5)
                }
                HStack{
                    Text("Enter your mobile number to get started.")
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
                        guard patientViewModel.sendOTP() else { return }
                        path.append(AuthState.verification)
                    }
                    .defaultButton()
                    
                }
                HStack{
                    Rectangle()
                        .fill(Color("Icon").opacity(0.5))
                        .frame(height: 1)
                    
                    Text("Or Sign Up with")
                        .subHeader2Color()
                        .font(.system(size: 14, weight: .regular))
                        .fixedSize()
                    
                    Rectangle()
                        .fill(Color("Icon").opacity(0.5))
                        .frame(height: 1)
                }.padding(.vertical, 35)
                
                HStack{
                    SignInWithAppleButton(.signUp) { _ in
                        path.append(AuthState.registration)
                    } onCompletion: { _ in
                    }
                    .signInWithAppleButtonStyle(.black)
                    .frame(height: 50)
                    .cornerRadius(12)
                    .padding(.vertical, 1)
                }
                
                HStack{
                    Button {
                        path.append(AuthState.registration)
                    } label: {
                        HStack(spacing: 12) {
                            Image("GoogleIcon")
                                .resizable()
                                .frame(width: 20, height: 20)
                            
                            Text("Sign up with Google")
                        }
                    }
                    .googleButton()
                    .padding(.vertical, 1)
                }
                
                HStack{
                    Text("Already have an Account? Sign In")
                        .subHeader1Color()
                        .underline()
                        .padding(.vertical, 35)
                        .onTapGesture {
                            path = NavigationPath()
                            path.append(AuthState.signIn)
                        }
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
    SignUpView(path: .constant(NavigationPath())).environmentObject(PatientViewModel())
}

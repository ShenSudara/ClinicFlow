//
//  SignUpView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-02-28.
//

import SwiftUI
import AuthenticationServices

struct SignUpView: View {
    @StateObject private var viewModel: PatientViewModel = PatientViewModel()
    
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
                    Text("Sign Up").header1().padding(.bottom, 0.5)
                }
                HStack{
                    Text("Enter your mobile number to get started.").body1()
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 15)
                }
                HStack{
                    TextField("Mobile Number", text: $viewModel.mobileNo)
                        .defaultTextField()
                        .padding(.bottom, 25)
                }
                HStack{
                    Button("Continue"){
                        print("Button Clicked")
                    }.defaultButton()
                        
                }
                HStack{
                    Rectangle()
                        .fill(Color("Icon").opacity(0.5))
                        .frame(height: 1)
                    
                    Text("Or Sign Up with")
                        .body3()
                        .fixedSize()
                    
                    Rectangle()
                        .fill(Color("Icon").opacity(0.5))
                        .frame(height: 1)
                }.padding(.vertical, 35)
                
                HStack{
                    SignInWithAppleButton(.signUp) { request in
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
                        print("Google Sign Up button is clicked")
                    } label: {
                        HStack(spacing: 12) {
                            Image("GoogleIcon")
                                .resizable()
                                .frame(width: 20, height: 20)

                            Text("Continue with Google")
                        }
                    }
                    .googleButton()
                    .padding(.vertical, 1)
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .commonLayout()
        .commonPadding()
        .commonBackground()
    }
}

#Preview {
    SignUpView()
}

//
//  AuthView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-02.
//

import SwiftUI

struct AuthView: View {
    @State private var path = NavigationPath()
    @EnvironmentObject var patientViewModel: PatientViewModel
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack(path: $path){
            SignUpView(path: $path)
                .navigationDestination(for: AuthState.self){route in
                    switch route{
                    case .signIn:
                        SignInView(path: $path)
                    case .signUp:
                        SignUpView(path: $path)
                    case .verification:
                        VerificationView(path: $path)
                    case .registration:
                        RegisterProfileView(path: $path)
                    }
                }
        }.onReceive(patientViewModel.$user) { newValue in
            guard newValue != .unknown else { return }
            
            if patientViewModel.user == UserState.newUser {
                path.append(AuthState.registration)
            } else if patientViewModel.user == UserState.existing{
                appViewModel.appState = .main
            }
        }
    }
}

#Preview {
    AuthView()
        .environmentObject(PatientViewModel())
        .environmentObject(AppViewModel())
}

//
//  AuthView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-02.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        NavigationStack{
            SignUpView()
        }
    }
}

#Preview {
    AuthView()
        .environmentObject(PatientViewModel())
        .environmentObject(AppViewModel())
}

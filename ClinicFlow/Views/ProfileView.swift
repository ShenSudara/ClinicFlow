//
//  ProfileView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-12.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var patientViewModel: PatientViewModel

    var body: some View {
        VStack(spacing: 0) {
            TabHeader(title: "Profile", isHome: true)
            SettingsScrollView().environmentObject(patientViewModel)
        }
        .commonLayout()
        .commonBackground()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    ProfileView()
        .environmentObject(PatientViewModel())
        .environmentObject(AppViewModel())
}

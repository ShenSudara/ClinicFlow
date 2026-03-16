//
//  MainView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-02.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        MainTabView()
    }
}

#Preview {
    MainView()
        .environmentObject(PatientViewModel())
        .environmentObject(AppViewModel())
}

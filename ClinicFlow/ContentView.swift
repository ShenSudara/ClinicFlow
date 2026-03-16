//
//  ContentView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-02-28.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var patientViewModel = PatientViewModel()
    @StateObject private var appViewModel = AppViewModel()
    @StateObject private var homeViewModel = HomeViewModel()
    
    var body: some View {
        switch appViewModel.appState {
        case .auth:
            AuthView()
                .environmentObject(patientViewModel)
                .environmentObject(appViewModel)
        case .main:
            MainView()
                .environmentObject(patientViewModel)
                .environmentObject(appViewModel)
                .environmentObject(homeViewModel)
        }
    }
}

#Preview {
    ContentView()
}

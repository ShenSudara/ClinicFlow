//
//  AppViewModel.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-02.
//

import SwiftUI
import Combine

@MainActor
class AppViewModel: ObservableObject {
    @Published var appState: AppState = .auth
    @Published var selectedTab: Int = 0
    @Published var selectedAppointmentID: String? = nil
}

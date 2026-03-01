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
}

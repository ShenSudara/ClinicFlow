//
//  AccessibilitySettingsViewModel.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-12.
//

import SwiftUI
import Combine

class AccessibilitySettingsViewModel: ObservableObject {
    @Published var boldText: Bool = false
    @Published var highContrast: Bool = true
    @Published var reduceMotion: Bool = false
    @Published var voiceOver: Bool = true
    @Published var largeText: Bool = false
}

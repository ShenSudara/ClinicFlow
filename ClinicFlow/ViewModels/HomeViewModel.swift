//
//  HomeViewModel.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-12.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var userName: String = "Ashen"
    @Published var selectedFeeling: String? = nil
    @Published var showFeelingSection: Bool = true
    @Published var appointments: [Appointment] = []
    @Published var quickActions: [QuickAction] = []
    @Published var insights: [HealthInsight] = []
    @Published var clinics: [Clinic] = []
    
    init(sampleToday: Bool = true) {
        loadData(includeToday: sampleToday)
    }

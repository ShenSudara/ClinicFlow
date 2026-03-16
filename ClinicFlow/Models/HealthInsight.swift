//
//  HealthInsight.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-12.
//

import Foundation
import SwiftUI

struct HealthInsight: Identifiable {
    let id: String
    let title: String
    let value: String
    let goal: String?
    let icon: String
    let progress: Double?
    let color: Color
    
    init(id: String = UUID().uuidString, title: String, value: String, goal: String? = nil, icon: String, progress: Double? = nil, color: Color = .blue) {
        self.id = id
        self.title = title
        self.value = value
        self.goal = goal
        self.icon = icon
        self.progress = progress
        self.color = color
    }
}

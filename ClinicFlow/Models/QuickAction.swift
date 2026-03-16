//
//  QuickAction.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-12.
//

import Foundation
import SwiftUI

struct QuickAction: Identifiable {
    let id: String
    let title: String
    let systemIcon: String
    let color: Color
    var destination: String? = nil
    
    init(id: String = UUID().uuidString, title: String, systemIcon: String, color: Color, destination: String? = nil) {
        self.id = id
        self.title = title
        self.systemIcon = systemIcon
        self.color = color
        self.destination = destination
    }
}

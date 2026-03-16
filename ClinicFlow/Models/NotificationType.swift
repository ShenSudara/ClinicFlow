//
//  NotificationType.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-12.
//

import Foundation
import SwiftUI

enum NotificationType: String {
    case turn
    case appointment
    case payment
    case lab
    
    var iconName: String {
        switch self {
        case .turn: return "exclamationmark.triangle.fill"
        case .appointment: return "calendar.badge.clock"
        case .payment: return "creditcard.fill"
        case .lab: return "testtube.2"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .turn: return Color.blue.opacity(0.12)
        case .appointment: return Color.orange.opacity(0.12)
        case .payment: return Color.green.opacity(0.12)
        case .lab: return Color.purple.opacity(0.12)
        }
    }
    
    var foregroundColor: Color {
            switch self {
            case .turn: return .blue
            case .appointment: return .orange
            case .payment: return .green
            case .lab: return .purple
            }
        }
    }

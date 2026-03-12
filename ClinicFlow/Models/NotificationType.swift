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
        case .lab: return "testtube.2.fill"
        }
    }

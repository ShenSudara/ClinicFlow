//
//  PaymentMethod.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-13.
//

import Foundation
import SwiftUI

enum PaymentMethod: String, CaseIterable, Identifiable {
    case applePay = "apple"
    case creditCard = "card"
    case insurance = "insurance"

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .applePay: return "Apple Pay"
        case .creditCard: return "Credit Card"
        case .insurance: return "Insurance"
        }
    }

    var systemIcon: String {
        switch self {
        case .applePay: return "applelogo"
        case .creditCard: return "creditcard.fill"
        case .insurance: return "shield.lefthalf.fill"
        }
    }

    var iconBackground: Color {
        switch self {
        case .applePay: return Color.black
        case .creditCard: return Color.blue
        case .insurance: return Color.green
        }
    }
}

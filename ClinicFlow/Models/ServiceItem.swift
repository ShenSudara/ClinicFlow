//
//  ServiceItem.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-001 on 2026-03-12.
//

import Foundation
import SwiftUI

enum ServiceType: String, Codable {
    case doctor
    case syringe
    case scan
    case pharmacy
    case payment
    
    var iconName: String {
        switch self {
        case .doctor: return "stethoscope"
        case .syringe: return "syringe"
        case .scan: return "xmark.shield"
        case .pharmacy: return "pills"
        case .payment: return "creditcard"
        }
    }
}

enum ServiceStatus: String, Codable {
    case completed
    case ongoing
    case pending

    var borderColor: Color {
        switch self {
        case .completed: return Color.green
        case .ongoing: return Color.blue
        case .pending: return Color.gray
        }
    }
    var iconCircleColor: Color {
        switch self {
        case .completed: return Color.green
        case .ongoing: return Color.blue
        case .pending: return Color.gray.opacity(0.6)
        }
    }
}

struct ServiceItem: Identifiable, Codable {
    let id: String
    let serviceName: String
    let status: ServiceStatus
    let room: String
    let time: String
    let type: ServiceType
    
    init(id: String = UUID().uuidString, serviceName: String, status: ServiceStatus, room: String, time: String, type: ServiceType) {
        self.id = id
        self.serviceName = serviceName
        self.status = status
        self.room = room
        self.time = time
        self.type = type
    }
}

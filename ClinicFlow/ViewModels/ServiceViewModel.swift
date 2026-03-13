//
//  ServiceViewModel.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-001 on 2026-03-12.
//

import Foundation
import SwiftUI
import Combine

class ServiceViewModel: ObservableObject {
    @Published var services: [ServiceItem] = []

    init() {
        loadServices()
    }

    func loadServices() {
        services = [
            ServiceItem(serviceName: "Consultation", status: .completed, room: "Room 302", time: "8:30 AM", type: .doctor),
            ServiceItem(serviceName: "Blood Test", status: .ongoing, room: "Room 302", time: "8:40 AM", type: .syringe),
            ServiceItem(serviceName: "Pharmacy", status: .pending, room: "Pharmacy", time: "9:15 AM", type: .pharmacy),
            ServiceItem(serviceName: "Payment", status: .pending, room: "cashier", time: "9:30 AM", type: .payment)
        ]
    }
}

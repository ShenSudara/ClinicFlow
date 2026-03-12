//
//  Clinic.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-12.
//

import Foundation
import SwiftUI

struct Clinic: Identifiable {
    let id: String
    let name: String
    let doctor: String
    let dateVisited: Date?
    let imageName: String?
    let accent: Color
    
    init(id: String = UUID().uuidString,
         name: String,
         doctor: String,
         dateVisited: Date? = nil,
         imageName: String? = nil,
         accent: Color = .blue) {
        self.id = id
        self.name = name
        self.doctor = doctor
        self.dateVisited = dateVisited
        self.imageName = imageName
        self.accent = accent
    }
}

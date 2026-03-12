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
    
    func loadData(includeToday: Bool) {
        quickActions = [
            QuickAction(title: "Book Now", systemIcon: "calendar.badge.plus", color: .blue),
            QuickAction(title: "Clinics", systemIcon: "mappin.and.ellipse", color: .green),
            QuickAction(title: "Tele Health", systemIcon: "video", color: .purple),
            QuickAction(title: "Contact", systemIcon: "phone", color: .orange)
        ]
        
        insights = [
            HealthInsight(title: "Daily Steps", value: "8,432", goal: "/ 10k", icon: "figure.walk", progress: 0.84, color: .blue),
            HealthInsight(title: "Heart Rate", value: "72", goal: "BPM", icon: "heart.fill", progress: nil, color: .red)
        ]
        
        clinics = [
            Clinic(name: "Cardiology Clinic", doctor: "Dr. Naduni Perera", dateVisited: Date(), imageName: "ClinicImage", accent: .purple),
            Clinic(name: "General Clinic", doctor: "Dr. Ashen Sudaraka", dateVisited: Date().addingTimeInterval(-86400 * 7), imageName: nil, accent: .green)
        ]
        
        var items: [Appointment] = []
        let calendar = Calendar.current
        let now = Date()
        
        if includeToday {
            if let todayDate = calendar.date(byAdding: .minute, value: 20, to: now) {
                items.append(Appointment(doctorName: "Dr. Ashen", clinicName: "General Clinic", date: todayDate, status: .pending, accent: .blue))
            }
        }
        
        if let tomorrow = calendar.date(byAdding: .day, value: 1, to: now) {
            items.append(Appointment(doctorName: "Dr. Shanel", clinicName: "Cardiology Clinic", date: calendar.date(bySettingHour: 9, minute: 30, second: 0, of: tomorrow) ?? tomorrow, status: .ongoing, accent: .green))
        }
        
        if let later = calendar.date(byAdding: .day, value: 3, to: now) {
            items.append(Appointment(doctorName: "Dr. K. Silva", clinicName: "Dental Clinic", date: calendar.date(bySettingHour: 14, minute: 0, second: 0, of: later) ?? later, status: .completed, accent: .orange))
        }
        appointments = items
    }
    
    func selectFeeling(_ feeling: String) {
            selectedFeeling = feeling
            withAnimation {
                showFeelingSection = false
            }
        }

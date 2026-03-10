//
//  AppointmentSegmentPicker.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-10.
//

import SwiftUI

enum AppointmentFilter: String, CaseIterable {
    case upcoming = "Upcoming"
    case past = "Past"
    case cancelled = "Cancelled"
}

struct AppointmentSegmentPicker: View {
    @Binding var selection: AppointmentFilter
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(AppointmentFilter.allCases, id: \.self) { filter in
                Text(filter.rawValue)
                    .font(.system(size: 16, weight: .medium))
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(selection == filter ? Color.white : Color.clear)
                    .foregroundColor(selection == filter ? .black : .gray)
                    .cornerRadius(10)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selection = filter
                        }
                    }
            }
        }
        .padding(4)
        .background(Color.gray.opacity(0.15))
        .cornerRadius(12)
        .padding(.horizontal, 20)
    }
}

//
//  ServiceTimelineView.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-001 on 2026-03-12.
//

import SwiftUI

struct ServiceTimelineView: View {
    @ObservedObject var vm: ServiceViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(vm.services.indices, id: \.self) { idx in
                    let item = vm.services[idx]
                    ServiceRowView(item: item, isLast: idx == vm.services.count - 1)
                }
            }
            .padding(.vertical, 12)
        }
        .commonBackground()
    }
}

#Preview {
    ServiceTimelineView(vm: ServiceViewModel())
        .environmentObject(PatientViewModel())
}

//
//  SectionHeaderView.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-001 on 2026-03-10.
//

struct SectionHeaderView: View {
    let title: String
    var actionText: String? = nil
    
    var body: some View {
        HStack {
            Text(title)
                .headerColor()
                .font(.system(size: 18, weight: .bold))
            Spacer()
            if let action = actionText {
                Button(action: {}) {
                    Text(action)
                        .font(.system(size: 14))
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

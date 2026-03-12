//
//  UrgentHelpPlaceholderView.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-12.
//

import SwiftUI

struct UrgentHelpPlaceholderView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 48))
                .foregroundColor(.red)
            Text("Urgent Help")
                .font(.title)
                .fontWeight(.bold)
            Text("This is a placeholder for urgent help flow. Replace with real content.")
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
        .padding()
        .navigationTitle("Urgent Help")
    }
}

#Preview {
    UrgentHelpPlaceholderView()
}

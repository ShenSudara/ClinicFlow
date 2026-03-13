//
//  BillSummaryCardView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-13.
//

import SwiftUI

struct BillSummaryCardView: View {
    var items: [(label: String, amount: String)]
    var total: String

    var body: some View {
        VStack(spacing: 12) {
            ForEach(Array(items.enumerated()), id: \ .offset) { idx, item in
                HStack {
                    Text(item.label)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                    Spacer()
                    Text(item.amount)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
                if idx < items.count - 1 {
                    Divider()
                }
            }
            Divider()
            HStack {
                Text("Total")
                    .font(.headline)
                Spacer()
                Text(total)
                    .font(.headline)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.04), radius: 6, x: 0, y: 2)
    }
}

struct BillSummaryCardView_Previews: PreviewProvider {
    static var previews: some View {
        BillSummaryCardView(items: [("Consultation","Rs. 1500"),("Blood Test","Rs. 800")], total: "Rs. 2300")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

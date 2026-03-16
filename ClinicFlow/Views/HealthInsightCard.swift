//
//  HealthInsightCard.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-12.
//

import SwiftUI

struct HealthInsightCard: View {
    let insight: HealthInsight
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: insight.icon)
                    .foregroundColor(insight.color)
                Spacer()
                Text(insight.title)
                    .font(.system(size: 12))
                    .subHeader2Color()
            }
            HStack(alignment: .bottom, spacing: 4) {
                Text(insight.value)
                    .font(.system(size: 20, weight: .bold))
                if let goal = insight.goal {
                    Text(goal)
                        .font(.system(size: 12))
                        .subHeader2Color()
                        .padding(.bottom, 2)
                }
            }
            if let p = insight.progress {
                ZStack(alignment: .leading) {
                    Capsule().fill(Color.gray.opacity(0.12)).frame(height: 6)
                    Capsule().fill(insight.color).frame(width: 100 * CGFloat(p), height: 6)
                }
            } else {
                HStack(alignment: .bottom, spacing: 4) {
                    ForEach(0..<6) { _ in
                        RoundedRectangle(cornerRadius: 2)
                            .fill(insight.color.opacity(0.5))
                            .frame(width: 4, height: CGFloat.random(in: 10...25))
                    }
                }
            }
        }
        .padding()
        .frame(height: 100)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.04), radius: 6, x: 0, y: 3)
    }
}

#Preview {
    HealthInsightCard(insight: HealthInsight(title: "Daily Steps", value: "8,432", goal: "/ 10k", icon: "figure.walk", progress: 0.84, color: .blue))
}

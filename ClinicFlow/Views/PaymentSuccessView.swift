//
//  PaymentSuccessView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-13.
//

import SwiftUI

struct PaymentSuccessView: View {
    var date: String
    var time: String
    var reference: String
    var amount: String
    var onDone: () -> Void

    @State private var animate = false

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            ZStack {
                Circle()
                    .fill(Color("NPrimaryColor").opacity(0.2))
                    .frame(width: 140, height: 140)
                Image(systemName: "checkmark")
                    .font(.system(size: 64, weight: .bold))
                    .foregroundColor(Color("NPrimaryColor"))
                    .scaleEffect(animate ? 1.0 : 0.6)
                    .animation(.spring(), value: animate)
            }
            Text("Payment Successful")
                .font(.title2)
                .bold()
            VStack(spacing: 8) {
                HStack { Text("Date"); Spacer(); Text(date) }
                HStack { Text("Time"); Spacer(); Text(time) }
                HStack { Text("Reference"); Spacer(); Text(reference) }
                HStack { Text("Amount"); Spacer(); Text(amount) }
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(12)
            Spacer()
            Button(action: onDone) {
                Text("Back to Home")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
        }
        .padding()
        .onAppear { animate = true }
    }
}

struct PaymentSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentSuccessView(date: "Mar 13, 2026", time: "10:45 AM", reference: "abcd1234", amount: "Rs. 4,100", onDone: {})
            .previewLayout(.sizeThatFits)
    }
}

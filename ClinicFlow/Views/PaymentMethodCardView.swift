//
//  PaymentMethodCardView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-13.
//

import SwiftUI

struct PaymentMethodCardView: View {
    @Binding var selectedMethod: PaymentMethod?
    @Binding var cardNumber: String
    @Binding var expiry: String
    @Binding var cvv: String
    @Binding var saveCard: Bool
    @Binding var insurancePolicy: String
    var onApplePay: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            ForEach(PaymentMethod.allCases) { method in
                VStack(spacing: 8) {
                    HStack(spacing: 12) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(method.iconBackground.opacity(0.15))
                                .frame(width: 44, height: 44)
                            Image(systemName: method.systemIcon)
                                .foregroundColor(method.iconBackground)
                        }
                        Text(method.displayName)
                            .font(.subheadline)
                        Spacer()
                        if selectedMethod == method {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.accentColor)
                        }
                    }
                    .padding(12)
                    .background(Color(.systemBackground))
                    .cornerRadius(10)
                    .onTapGesture {
                        withAnimation { selectedMethod = method }
                        if method == .applePay { onApplePay() }
                    }

                    if selectedMethod == .creditCard && method == .creditCard {
                        VStack(spacing: 8) {
                            TextField("Card Number", text: $cardNumber)
                                .keyboardType(.numberPad)
                                .textFieldStyle(.roundedBorder)
                            HStack {
                                TextField("MM/YY", text: $expiry)
                                    .textFieldStyle(.roundedBorder)
                                TextField("CVV", text: $cvv)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 100)
                            }
                            Toggle("Save card for future", isOn: $saveCard).tint(Color("NPrimaryColor"))
                        }
                        .padding(.horizontal, 4)
                        .transition(.opacity.combined(with: .move(edge: .top)))
                    }

                    if selectedMethod == .insurance && method == .insurance {
                        TextField("Policy number", text: $insurancePolicy)
                            .textFieldStyle(.roundedBorder)
                            .transition(.opacity.combined(with: .move(edge: .top)))
                    }
                }
            }
        }
    }
}

struct PaymentMethodCardView_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State var method: PaymentMethod? = .creditCard
        @State var cardNum = ""
        @State var expiry = ""
        @State var cvv = ""
        @State var save = false
        @State var policy = ""
        var body: some View {
            PaymentMethodCardView(selectedMethod: $method, cardNumber: $cardNum, expiry: $expiry, cvv: $cvv, saveCard: $save, insurancePolicy: $policy, onApplePay: {})
                .padding()
        }
    }
    static var previews: some View {
        PreviewWrapper()
            .previewLayout(.sizeThatFits)
    }
}

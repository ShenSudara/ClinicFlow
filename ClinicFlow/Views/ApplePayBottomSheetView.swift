//
//  ApplePayBottomSheetView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-13.
//

import SwiftUI

struct ApplePayBottomSheetView: View {
    var cardLabel: String
    var shippingLabel: String
    var totalAmount: String
    var isProcessing: Bool
    var onConfirm: () -> Void
    var onDismiss: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Spacer()
                Button(action: onDismiss) {
                    Image(systemName: "xmark")
                        .foregroundColor(Color("NPrimaryColor"))
                }
            }
            Text("Apple Pay")
                .font(.headline)
            VStack(spacing: 12) {
                HStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("NPrimaryColor"))
                        .frame(width: 48, height: 32)
                        .overlay(Text(cardLabel).foregroundColor(.white).font(.caption))
                    VStack(alignment: .leading) {
                        Text(cardLabel).font(.subheadline).bold()
                        Text(shippingLabel).font(.caption).foregroundColor(.secondary)
                    }
                    Spacer()
                }
                HStack {
                    Text("Total")
                    Spacer()
                    Text(totalAmount).bold()
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(12)
            Spacer()
            if isProcessing {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                Button(action: onConfirm) {
                    HStack {
                        Spacer()
                        Text("Pay with Face ID")
                        Spacer()
                    }
                    .padding()
                    .background(Color("NPrimaryColor"))
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
            }
        }
        .padding()
    }
}

struct ApplePayBottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ApplePayBottomSheetView(cardLabel: "Visa •• 4242", shippingLabel: "Home", totalAmount: "Rs. 4,100", isProcessing: false, onConfirm: {}, onDismiss: {})
            .previewLayout(.sizeThatFits)
    }
}

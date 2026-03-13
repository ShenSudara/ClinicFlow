//
//  PaymentViewModel.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-13.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class PaymentViewModel: ObservableObject {
    @Published var consultationFee: Double = 1500
    @Published var bloodTestFee: Double = 800
    @Published var ecgFee: Double = 600
    @Published var pharmacyFee: Double = 1200

    @Published var selectedMethod: PaymentMethod? = nil
    @Published var showApplePaySheet: Bool = false
    @Published var isProcessing: Bool = false
    @Published var paymentSuccess: Bool = false

    @Published var cardNumber: String = ""
    @Published var expiryDate: String = ""
    @Published var cvv: String = ""
    @Published var saveCard: Bool = false

    @Published var insurancePolicy: String = ""

    @Published private(set) var transactionDate: String = ""
    @Published private(set) var transactionTime: String = ""
    @Published private(set) var referenceID: String = ""

    var totalAmount: Double { consultationFee + bloodTestFee + ecgFee + pharmacyFee }

    var totalFormatted: String { formatCurrency(totalAmount) }

    func selectMethod(_ method: PaymentMethod) {
        selectedMethod = method
        if method == .applePay {
            showApplePaySheet = true
        }
    }

    func processPayment() async {
        guard selectedMethod != nil else { return }
        isProcessing = true
        try? await Task.sleep(nanoseconds: 1_200_000_000)
        transactionDate = formattedDate()
        transactionTime = formattedTime()
        referenceID = String(UUID().uuidString.prefix(8)).lowercased()
        isProcessing = false
        paymentSuccess = true
    }

    func formattedDate() -> String {
        let df = DateFormatter()
        df.dateStyle = .medium
        return df.string(from: Date())
    }

    func formattedTime() -> String {
        let tf = DateFormatter()
        tf.timeStyle = .short
        return tf.string(from: Date())
    }

    func formatCurrency(_ value: Double) -> String {
        let fmt = NumberFormatter()
        fmt.numberStyle = .currency
        fmt.locale = Locale.current
        return fmt.string(from: NSNumber(value: value)) ?? "Rs. \(value)"
    }
}

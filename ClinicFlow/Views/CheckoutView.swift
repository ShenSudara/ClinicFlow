import SwiftUI

struct CheckoutView: View {
    @ObservedObject var vm: PaymentViewModel
    @State private var showApplePaySheet = false
    @State private var showSuccess = false
    var onFinish: (() -> Void)? = nil

    var body: some View {
        VStack{
            VStack(spacing: 0) {
                AppHeader(title: "Checkout", showBackButton: true)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Bill Summary")
                            .font(.headline)
                            .padding(.top, 15)
                        BillSummaryCardView(
                            items: [
                                ("Consultation", vm.formatCurrency(vm.consultationFee)),
                                ("Blood Test", vm.formatCurrency(vm.bloodTestFee)),
                                ("ECG Test", vm.formatCurrency(vm.ecgFee)),
                                ("Pharmacy", vm.formatCurrency(vm.pharmacyFee))
                            ],
                            total: vm.totalFormatted
                        )

                        Text("Payment Method")
                            .font(.headline)

                        PaymentMethodCardView(
                            selectedMethod: $vm.selectedMethod,
                            cardNumber: $vm.cardNumber,
                            expiry: $vm.expiryDate,
                            cvv: $vm.cvv,
                            saveCard: $vm.saveCard,
                            insurancePolicy: $vm.insurancePolicy,
                            onApplePay: {
                                showApplePaySheet = true
                            }
                        )

                        HStack{
                            Text("Payments are processed securely.")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }.frame(maxWidth: .infinity, alignment: .center)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .commonLayout()
            .commonPadding()
            .commonBackground()
            
            VStack {
                Button(action: {
                    Task { await vm.processPayment(); if vm.paymentSuccess { showSuccess = true } }
                }) {
                    if vm.isProcessing {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .frame(maxWidth: .infinity)
                            .padding()
                    } else {
                        Text("Pay & Confirm")
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                }
                .disabled(vm.selectedMethod == nil || vm.isProcessing)
                .background((vm.selectedMethod == nil || vm.isProcessing) ? Color(.systemGray4) : Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(12)
            }
            .commonPadding()
            .padding(.vertical, 15)
            .sheet(isPresented: $showApplePaySheet) {
                ApplePayBottomSheetView(cardLabel: "Visa •• 4242", shippingLabel: "Home", totalAmount: vm.totalFormatted, isProcessing: vm.isProcessing, onConfirm: {
                    Task { await vm.processPayment(); if vm.paymentSuccess { showSuccess = true } }
                }, onDismiss: { showApplePaySheet = false })
            }
            .fullScreenCover(isPresented: $showSuccess) {
                PaymentSuccessView(date: vm.transactionDate, time: vm.transactionTime, reference: vm.referenceID, amount: vm.totalFormatted) {
                    showSuccess = false
                    onFinish?()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CheckoutView(vm: PaymentViewModel(), onFinish: {})
        }
    }
}

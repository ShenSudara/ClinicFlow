//
//  PaymentView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-13.
//

import SwiftUI

struct PaymentView: View {
    @StateObject private var vm = PaymentViewModel()
    @State private var navigateToCheckout = false

    var body: some View {
        VStack{
            VStack(spacing: 0) {
                AppHeader(title: "Payment", showBackButton: true)

                ScrollView {
                    VStack(spacing: 30) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Payment Services")
                                .font(.headline)
                                .padding(.top, 15)
                            VStack {
                                MedicalServiceRowView(iconName: "drop.fill", iconBg: .red, title: "Blood Test", subtitle: vm.formatCurrency(vm.bloodTestFee))
                                Divider()
                                MedicalServiceRowView(iconName: "bag.fill", iconBg: .blue, title: "Pharmacy", subtitle: vm.formatCurrency(vm.pharmacyFee))
                                Divider()
                                MedicalServiceRowView(iconName: "waveform.path.ecg", iconBg: .purple, title: "ECG Test", subtitle: vm.formatCurrency(vm.ecgFee))
                            }
                            .padding()
                            .background(.white)
                            .cornerRadius(12)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Billing")
                                .font(.headline)
                            BillSummaryCardView(items: [("Consultation", vm.formatCurrency(vm.consultationFee)), ("Blood Test", vm.formatCurrency(vm.bloodTestFee)), ("ECG Test", vm.formatCurrency(vm.ecgFee)), ("Pharmacy", vm.formatCurrency(vm.pharmacyFee))], total: vm.totalFormatted)
                        }
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Location")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.secondary)

                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.gray.opacity(0.12))
                                    .frame(height: 160)
                                Image("map")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 160)
                                    .clipped()
                                    .cornerRadius(12)
                            }

                            HStack(spacing: 12) {
                                Button(action: {}) {
                                    HStack {
                                        Image(systemName: "arrow.triangle.turn.up.right.circle.fill")
                                        Text("Get Directions")
                                            .font(.system(size: 14, weight: .bold))
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                    )
                                }

                                NavigationLink(destination: IndoorNavView(serviceName: "Payment", roomNumber: "Billing Desk")) {
                                    HStack {
                                        Image(systemName: "location.fill.viewfinder")
                                        Text("Indoor Nav")
                                            .font(.system(size: 14, weight: .bold))
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                    )
                                }
                            }
                        }
                        .padding(16)
                        .background(Color.white)
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.04), radius: 4, x: 0, y: 2)
                    }
                }
                .scrollIndicators(.hidden)
            }
            .commonLayout()
            .commonPadding()
            .commonBackground()
            
            VStack {
                Button(action: {
                    navigateToCheckout = true
                }) {
                    Text("Pay Now")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .navigationDestination(isPresented: $navigateToCheckout) {
                CheckoutView(vm: vm, onFinish: {
                    navigateToCheckout = false
                })
            }
            .commonPadding()
            .padding(.vertical, 15)
            .background(.white)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    NavigationStack {
        PaymentView()
    }
}

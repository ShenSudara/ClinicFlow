//
//  UrgentHelpPlaceholderView.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-12.
//

import SwiftUI

struct UrgentHelpPlaceholderView: View {
    @EnvironmentObject private var appViewModel: AppViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 0) {
            AppHeader(title: "Emergency", showBackButton: true)
                .padding(.bottom, 20)
            Spacer()
            VStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(Color(red: 1.0, green: 0.9, blue: 0.9))
                        .frame(width: 140, height: 140)
                    
                    ZStack {
                        Circle()
                            .fill(Color(red: 1.0, green: 0.9, blue: 0.9))
                            .frame(width: 140, height: 140)
                        
                        ZStack {
                            Image(systemName: "briefcase.fill")
                                .font(.system(size: 56))
                                .foregroundColor(.red)
                        }
                    }
                }
                Text("Emergency Assistance")
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                Text("Please stay calm. A medical professional is ready to assist you.")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color(red: 0.287, green: 0.314, blue: 0.341))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                Text("Tap the button below to connect immediately.")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 24)

            Spacer()

            VStack(spacing: 12) {
                Button(action: {
                    if let url = URL(string: "tel://+1234567890"), UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                    }
                }) {
                    HStack {
                        Image(systemName: "phone.arrow.up.right.fill")
                        Text("Call Clinic Emergency Line")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0.149, green: 0.404, blue: 1.0))
                    .cornerRadius(12)
                }
                .accessibilityLabel("Call clinic emergency line")
                .accessibilityAddTraits(.isButton)

                Button(action: {
                    appViewModel.appState = .main
                }) {
                    Text("Return to Home")
                        .foregroundColor(.primary)
                }
                .accessibilityLabel("Return to home")
                .padding(.bottom, 12)
            }
        }
        .commonLayout()
        .commonPadding()
        .commonBackground()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    NavigationStack {
        UrgentHelpPlaceholderView()
            .environmentObject(AppViewModel())
    }
}

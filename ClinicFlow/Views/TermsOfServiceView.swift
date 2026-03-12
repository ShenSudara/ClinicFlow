//
//  TermsOfServiceView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-12.
//

import SwiftUI

struct TermsOfServiceView: View {
    var body: some View {
        VStack {
            AppHeader(title: "Terms of Service", showBackButton: true)
                .commonPadding()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Last updated: February 24, 2026")
                        .font(.system(size: 14))
                        .foregroundColor(Color("NPrimaryColor"))
                    Group {
                        Text("1. Acceptance of Terms")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                        Text("By accessing or using the Clinic Flow application, you agree to be bound by these Terms of Service. If you do not agree to these terms, please do not use the application.")
                        Text("2. Use of the Application")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                        Text("Clinic Flow is intended for use by registered patients and healthcare providers for appointment scheduling and healthcare management. You agree to use the application only for lawful purposes and in accordance with these terms.")
                        Text("3. Account Responsibility")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                        Text("You are responsible for maintaining the confidentiality of your account credentials. Any activity that occurs under your account is your responsibility. Please notify us immediately if you suspect unauthorized access to your account.")
                        Text("4. Medical Disclaimer")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                        Text("Clinic Flow is a scheduling and communication platform and does not provide medical advice. All medical decisions should be made in consultation with qualified healthcare professionals. We are not liable for any health outcomes resulting from use of this application.")
                        Text("5. Changes to Terms")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                        Text("We reserve the right to modify these Terms of Service at any time. Continued use of the application after changes are posted constitutes your acceptance of the revised terms. We will notify users of significant changes via the application.")
                    }
                }.padding(.vertical, 30)
            }
            .commonLayout()
            .commonPadding()
            .commonBackground()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    TermsOfServiceView()
}

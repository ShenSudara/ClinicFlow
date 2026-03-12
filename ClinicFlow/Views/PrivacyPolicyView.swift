//
// PrivacyPolicyView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-12.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        VStack {
            AppHeader(title: "Privacy Policy", showBackButton: true).commonPadding()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Last updated: February 24, 2026")
                        .font(.system(size: 14))
                        .foregroundColor(Color("NPrimaryColor"))
                    Group {
                        Text("1. Data Collection")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                        Text("At Clinic Flow, we collect personal information that you provide to us directly. This includes your name, email address, phone number, and medical history necessary for scheduling appointments and providing healthcare services. We also collect device information and usage data to improve our application experience.")

                        Text("2. How We Use Your Data")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                        Text("Your data is used to manage your appointments, facilitate communication with healthcare providers, and ensure the security of your account. We may also use anonymized data for clinical research and application performance monitoring to enhance our flow and service quality.")
                        Text("3. Data Sharing")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                        Text("We do not sell your personal information to third parties. We share your data only with authorized medical professionals within the Clinic Flow network and trusted service providers who assist in our operations, all of whom are bound by strict confidentiality agreements.")
                        Text("4. Your Rights")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                        Text("You have the right to access, correct, or delete your personal information at any time. You can manage your notification preferences and data sharing settings through the Profile section of the app. If you have concerns about your data, please contact our privacy officer.")
                    }
                }
                .padding(.vertical, 30)
            }
            .scrollIndicators(.hidden)
            .commonPadding()
            .commonLayout()
            .commonBackground()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    PrivacyPolicyView()
}

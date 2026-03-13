//
//  SettingsScrollView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-12.
//

import SwiftUI

struct SettingsScrollView: View {
    @EnvironmentObject var patientViewModel: PatientViewModel
    @EnvironmentObject var appViewModel: AppViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                HStack(alignment: .center) {
                    HStack(spacing: 12) {
                        Image("user2")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                        VStack(alignment: .leading, spacing: 6) {
                            Text(patientViewModel.patient.name ?? "Patient Name")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.black)
                            Text(patientViewModel.patient.mobileNo.isEmpty ? "07X XXX XXXX" : patientViewModel.patient.mobileNo)
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(Color("SubHeader2"))
                        }
                    }
                    Spacer()
                    NavigationLink(destination: PersonalInformationView().environmentObject(patientViewModel)) {
                        ZStack {
                            Circle()
                                .fill(Color("NPrimaryColor"))
                                .frame(width: 40, height: 40)
                            Image(systemName: "pencil")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                        }
                    }
                }
                .padding(.vertical,15)
                .padding(.horizontal, 12)
                .background(Color.white)
                .cornerRadius(20)
                
                VStack(spacing: 15) {
                    VStack(spacing: 0) {
                        HStack {
                            Text("ACCOUNT")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(Color("SubHeader2"))
                            Spacer()
                        }
                        .padding(6)
                        VStack(spacing: 0) {
                            NavigationLink(destination: PersonalInformationView().environmentObject(patientViewModel)) {
                                HStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color("NPrimaryColor"))
                                            .frame(width: 36, height: 36)
                                        Image(systemName: "person.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .semibold))
                                    }.padding(4)
                                    Text("Personal Information")
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color("SubHeader2"))
                                }
                                .padding(12)
                                .background(Color.white)
                            }
                            Divider()
                                .padding(.leading, 60)
                            Button(action: {}) {
                                HStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(.green)
                                            .frame(width: 36, height: 36)
                                        Image(systemName: "lock.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .semibold))
                                    }.padding(4)
                                    Text("Security & Face ID")
                                        .foregroundColor(.black)
                                    Spacer()
                                    HStack(spacing: 6) {
                                        Text("On")
                                            .foregroundColor(Color("SubHeader2"))
                                            .font(.system(size: 14, weight: .medium))
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(Color("SubHeader2"))
                                    }
                                }
                                .padding(12)
                                .background(Color.white)
                            }
                        }
                        .cornerRadius(12)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.clear, lineWidth: 0))
                    }
                    VStack(spacing: 0) {
                        HStack {
                            Text("APP")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(Color("SubHeader2"))
                            Spacer()
                        }
                        .padding(6)
                        VStack(spacing: 0) {
                            Button(action: {}) {
                                HStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(.red)
                                            .frame(width: 36, height: 36)
                                        Image(systemName: "bell.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .semibold))
                                    }.padding(4)
                                    Text("Notifications")
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color("SubHeader2"))
                                }
                                .padding(12)
                                .background(Color.white)
                            }
                            Divider().padding(.leading, 60)
                            NavigationLink(destination: AccessibilitySettingsView()) {
                                HStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color("NPrimaryColor"))
                                            .frame(width: 36, height: 36)
                                        Image(systemName: "figure.stand")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .semibold))
                                    }.padding(4)
                                    Text("Accessibility")
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color("SubHeader2"))
                                }
                                .padding(12)
                                .background(Color.white)
                            }
                            Divider().padding(.leading, 60)
                            Button(action: {}) {
                                HStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(.cyan)
                                            .frame(width: 36, height: 36)
                                        Image(systemName: "globe")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .semibold))
                                    }.padding(4)
                                    Text("Language")
                                        .foregroundColor(.black)
                                    Spacer()
                                    HStack(spacing: 6) {
                                        Text("English")
                                            .foregroundColor(Color("SubHeader2"))
                                            .font(.system(size: 14, weight: .medium))
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(Color("SubHeader2"))
                                    }
                                }
                                .padding(12)
                                .background(Color.white)
                            }
                        }
                        .cornerRadius(12)
                    }
                    VStack(spacing: 0) {
                        HStack {
                            Text("LEGAL")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(Color("SubHeader2"))
                            Spacer()
                        }
                        .padding(6)
                        VStack(spacing: 0) {
                            NavigationLink(destination: PrivacyPolicyView()) {
                                HStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(.gray)
                                            .frame(width: 36, height: 36)
                                        Image(systemName: "shield")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .semibold))
                                    }.padding(4)
                                    Text("Privacy Policy")
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color("SubHeader2"))
                                }
                                .padding(12)
                                .background(Color.white)
                            }
                            Divider().padding(.leading, 60)
                            NavigationLink(destination: TermsOfServiceView()) {
                                HStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(.gray)
                                            .frame(width: 36, height: 36)
                                        Image(systemName: "doc.text")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .semibold))
                                    }.padding(4)
                                    Text("Terms of Service")
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color("SubHeader2"))
                                }
                                .padding(12)
                                .background(Color.white)
                            }
                        }
                        .cornerRadius(12)
                    }
                }
            }
            .padding(.vertical, 30)
            .commonPadding()
            .commonLayout()
        }.commonBackground()
    }
}

#Preview {
    SettingsScrollView().environmentObject(PatientViewModel()).environmentObject(AppViewModel())
}

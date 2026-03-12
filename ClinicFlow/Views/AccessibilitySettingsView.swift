//
//  AccessibilitySettingsView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-12.
//

import SwiftUI
import Combine

struct AccessibilitySettingsView: View {
    @StateObject private var vm = AccessibilitySettingsViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            AppHeader(title: "Accessibility", showBackButton: true).commonPadding()
            VStack(alignment: .leading){
                VStack(spacing: 0) {
                    AccessibilityRow(icon: "bold", title: "Bold Text", binding: $vm.boldText)
                    Divider()
                    AccessibilityRow(icon: "circle.lefthalf.filled", title: "High Contrast", binding: $vm.highContrast)
                    Divider().padding(.leading, 60)
                    AccessibilityRow(icon: "sun.max", title: "Reduce Motion", binding: $vm.reduceMotion)
                    Divider().padding(.leading, 60)
                    AccessibilityRow(icon: "speaker.wave.2.fill", title: "Voice Over", binding: $vm.voiceOver)
                    Divider().padding(.leading, 60)
                    AccessibilityRow(icon: "textformat.size", title: "Large Text", binding: $vm.largeText)
                }
                .background(Color.white)
                .cornerRadius(12)
                .padding(.vertical, 25)
                Spacer()
            }
            .commonLayout()
            .commonPadding()
            .commonBackground()
        }

        .navigationBarHidden(true)
    }

    private func AccessibilityRow(icon: String, title: String, binding: Binding<Bool>) -> some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("IconBackground"))
                    .frame(width: 36, height: 36)
                Image(systemName: icon)
                    .foregroundColor(Color("NPrimaryColor"))
            }
            Text(title)
                .foregroundColor(.black)
            Spacer()
            Toggle("", isOn: binding)
                .labelsHidden()
                .tint(Color("NPrimaryColor"))
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 12)
    }
}

#Preview {
    AccessibilitySettingsView()
}

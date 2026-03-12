//
//  FeelingCardView.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-12.
//

import SwiftUI

struct FeelingCardGrid: View {
    @ObservedObject var vm: HomeViewModel
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            FeelingItem(label: "Good", icon: "face.smiling.fill", color: .green) {
                vm.selectFeeling("Good")
            }
            FeelingItem(label: "Ok", icon: "face.dashed.fill", color: .blue) {
                vm.selectFeeling("Ok")
            }
            FeelingItem(label: "Not Well", icon: "face.smiling.inverse", color: .orange) {
                vm.selectFeeling("Not Well")
            }
            NavigationLink(destination: UrgentHelpPlaceholderView()) {
                FeelingItem(label: "Urgent Help", icon: "exclamationmark.triangle.fill", color: .red){
                    vm.selectFeeling("Urgent Help")
                }
            }
        }
    }
}

struct FeelingItem: View {
    let label: String
    let icon: String
    let color: Color
    let action: () -> Void

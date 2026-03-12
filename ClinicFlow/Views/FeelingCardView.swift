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
    
    var body: some View {
           Button(action: action) {
               VStack(spacing: 12) {
                   ZStack {
                       RoundedRectangle(cornerRadius: 12)
                           .fill(Color.white)
                           .aspectRatio(1.2, contentMode: .fit)
                           .frame(width: 180)
                           .shadow(color: Color.black.opacity(0.04), radius: 6, x: 0, y: 3)
                       VStack(spacing: 8) {
                           Circle()
                               .fill(color.opacity(0.12))
                               .frame(width: 56, height: 56)
                               .overlay(
                                   Image(systemName: icon)
                                       .foregroundColor(color)
                                       .font(.system(size: 26))
                               )
                           Text(label)
                               .font(.system(size: 15, weight: .semibold))
                               .headerColor()
                       }
                   }
               }.overlay(
                   RoundedRectangle(cornerRadius: 15)
                       .stroke(color.opacity(0.2), lineWidth: 1)
               )
           }
           .buttonStyle(PlainButtonStyle())
           .accessibilityLabel(label)
       }
   }

   #Preview {
       FeelingCardGrid(vm: HomeViewModel())
   }

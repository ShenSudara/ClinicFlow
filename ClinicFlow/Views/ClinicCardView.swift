//
//  ClinicCardView.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-12.
//

import SwiftUI

struct ClinicCardView: View {
    let clinic: Clinic
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let img = clinic.imageName {
                Image(img)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 100)
                    .clipped()
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.1))
                    .frame(width: 180, height: 100)
                    .overlay(
                        Image(systemName: "building.2.crop.circle")
                            .font(.system(size: 32))
                            .foregroundColor(.gray)
                    )
            }
            
            

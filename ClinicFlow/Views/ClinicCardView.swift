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
            
            Text(clinic.name)
                            .font(.system(size: 16, weight: .bold))
                        Text(clinic.doctor)
                            .font(.system(size: 12))
                            .subHeader2Color()
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "calendar")
                                Text("View")
                            }
                            .font(.system(size: 12, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .background(Color("NPrimaryColor"))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                    }
                    .frame(width: 180)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.04), radius: 6, x: 0, y: 3)
                }
            }

            #Preview {
                ClinicCardView(clinic: Clinic(name: "Cardiology Clinic", doctor: "Dr A", dateVisited: Date(), imageName: nil, accent: .purple))
            }

//
//  MainHeader.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-10.
//
import SwiftUI

struct MainHeader: View {
    let title: String
    let profileImageName: String
    
    var body: some View {
        HStack {
            Text(title)
                .headerColor()
                .font(.system(size: 32, weight: .bold))
            
            Spacer()
            
            Image(profileImageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
    }
}

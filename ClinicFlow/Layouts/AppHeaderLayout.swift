//
//  AppHeaderLayout.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-01.
//

import SwiftUI

struct AppHeader: View {
    
    let title: String
    var showBackButton: Bool = false
    var backAction: (() -> Void)? = nil
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack{
            
            HStack{
                if showBackButton {
                    Button {
                        if let backAction = backAction {
                            backAction()
                        } else {
                            dismiss()
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(Color("NPrimaryColor"))
                    }
                }
                Spacer()
            }
            
            Text(title)
                .headerColor()
                .font(.system(size: 20, weight: .semibold))
        }
        .padding(.top, 10)
    }
}

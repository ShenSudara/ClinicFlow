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
    var showDoneButton: Bool = false
    var backAction: (() -> Void)? = nil
    var doneAction: (() -> Void)? = nil
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
                        HStack{
                            Image(systemName: "chevron.left")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color("NPrimaryColor"))
                            Text("Back")
                                .primaryColor()
                                .font(.system(size: 16, weight: .semibold))
                        }.contentShape(Rectangle())
                    }
                }
                Spacer()
            }
            
            Text(title)
                .headerColor()
                .font(.system(size: 20, weight: .semibold))
            
            HStack{
                Spacer()
                if showDoneButton {
                    Button{
                        if let doneAction = doneAction{
                            doneAction()
                        }
                    } label: {
                        Text("Done")
                            .primaryColor()
                            .font(.system(size: 16, weight: .semibold))
                    }
                }
            }
        }
        .padding(.top, 10)
    }
}

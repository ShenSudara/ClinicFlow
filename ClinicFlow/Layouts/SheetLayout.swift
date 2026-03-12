//
//  SheetLayout.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-09.
//

import SwiftUI

struct EditProfileFieldSheet: View {
    
    var title: String
    var label: String = ""
    @Binding var value: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            HStack{
                AppHeader(title: title, showBackButton: true, showDoneButton: true, doneAction: {
                    dismiss()
                })
            }
            .padding(.vertical)
            VStack(alignment: .leading){
                Text(label)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.black)
                    .padding(.bottom, 10)
                
                TextField(value, text: $value)
                    .foregroundColor(Color("SubHeader1"))
                    .textInputAutocapitalization(.never)
                    .defaultTextField()
            }
            .contentShape(Rectangle())
        }
        .commonPadding()
        .commonLayout()
        .commonBackground()
        .presentationDetents([.large])
    }
}

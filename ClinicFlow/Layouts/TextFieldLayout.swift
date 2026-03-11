//
//  TextFieldLayout.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-02-28.
//

import SwiftUI

struct DefaultTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding(15)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(Color("IconBackground"), lineWidth: 1)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                    )
                    .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
            )
            .font(.system(size: 18, weight: .regular, design: .rounded))
            .foregroundColor(.black)
            .accentColor(Color("IconBackground") )
    }
}


struct ProfileTextField : View {
    let label: String
    let placeholder : String
    @Binding var text: String
    
    var body: some View {
        HStack{
            Text(label)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.black)
                .frame(width: 110, alignment: .leading)
            
            TextField(placeholder, text: $text)
                .font(.system(size: 18, weight: .medium))
                .padding(.vertical, 8)
                .padding(.horizontal, 25)
                .foregroundColor(Color("SubHeader2"))
                .disabled(true)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .contentShape(Rectangle())
    }
}

extension View {
    func defaultTextField(strokeColor: Color = Color("IconBackground"), shadowColor: Color = Color.black.opacity(0.05)) -> some View {
        self.textFieldStyle(DefaultTextFieldStyle())
    }
}

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
                    .strokeBorder(Color("IconBackground").opacity(0.5), lineWidth: 1)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                    )
                    .shadow(color: Color.black.opacity(0.3), radius: 2, x: 0, y: 1)
            )
            .font(.system(size: 18, weight: .regular, design: .rounded))
            .foregroundColor(.black)
            .accentColor(Color("IconBackground") )
    }
}

extension View {
    func defaultTextField(strokeColor: Color = Color("IconBackground"), shadowColor: Color = Color.black.opacity(0.05)) -> some View {
        self.textFieldStyle(DefaultTextFieldStyle())
    }
}

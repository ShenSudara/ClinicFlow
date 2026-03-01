//
//  ViewLayout.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-02-28.
//

import SwiftUI

extension View {
    func commonPadding() -> some View {
        self
            .padding(.horizontal, 20)
    }
    
    func commonLayout() -> some View {
        self.frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
    }
    
    func commonBackground() -> some View {
        self.background(Color("Background"))
    }
}

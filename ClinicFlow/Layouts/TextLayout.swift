//
//  TextLayout.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-02-28.
//

import SwiftUI

extension Text{
    func headerColor() -> some View{
        self.foregroundColor(Color("Header"))
    }
    
    func subHeader1Color()-> some View{
        self.foregroundColor(Color("SubHeader1"))
    }
    
    func subHeader2Color()-> some View{
        self.foregroundColor(Color("SubHeader2"))
    }
    
    func primaryColor() -> some View{
        self.foregroundColor(Color("NPrimaryColor"))
    }
    
    func iconColor() -> some View{
        self.foregroundColor(Color("Icon"))
    }
}

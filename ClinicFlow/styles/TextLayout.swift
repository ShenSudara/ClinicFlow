//
//  TextLayout.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-02-28.
//

import SwiftUI

extension Text{
    func title1() -> some View{
        self
            .font(.system(size: 36, weight: .bold))
            .foregroundColor(Color("Header"))
    }
    
    func header1() -> some View{
        self
            .font(.system(size: 36, weight: .bold))
            .foregroundColor(Color("Header"))
    }
    
    func header2() -> some View{
        self
            .font(.system(size: 30, weight: .bold))
            .foregroundColor(Color("Header"))
    }
    
    func header3() -> some View{
        self
            .font(.system(size: 28, weight: .bold))
            .foregroundColor(Color("Header"))
    }
    
    func header4() -> some View{
        self
            .font(.system(size: 24, weight: .bold))
            .foregroundColor(Color("Header"))
    }
    
    func header5()-> some View{
        self
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(Color("Header"))
    }
    
    func body1()-> some View{
        self
            .font(.system(size: 18, weight: .regular))
            .foregroundColor(Color("SubHeader2"))
    }
    
    func body2()-> some View{
        self
            .font(.system(size: 16, weight: .regular))
            .foregroundColor(Color("Header"))
    }
    
    func body3()-> some View{
        self
            .font(.system(size: 14, weight: .regular))
            .foregroundColor(Color("SubHeader2"))
    }
    
    func body4()-> some View{
        self
            .font(.system(size: 12, weight: .regular))
            .foregroundColor(Color("Header"))
    }
    
    func icon()-> some View{
        self
            .font(.system(size: 10, weight: .regular))
            .foregroundColor(Color("Header"))
    }
    
}

//
//  RegisterProfileView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-01.
//

import SwiftUI

struct RegisterProfileView: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack{
            AppHeader(title:"Set Up Profile", showBackButton: true)
            Text("This is Set Up Profile Page.")
        }
        .commonLayout()
        .commonBackground()
        .commonPadding()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    RegisterProfileView(path: .constant(NavigationPath())).environmentObject(PatientViewModel())
}

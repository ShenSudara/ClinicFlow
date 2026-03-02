//
//  HomeView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-01.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var patientViewModel : PatientViewModel
    
    var body: some View {
        VStack{
            Text("This is Dashboard Home Page.")
        }
        .commonLayout()
        .commonPadding()
        .commonBackground()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    HomeView().environmentObject(PatientViewModel())
}

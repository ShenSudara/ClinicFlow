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
        ZStack{
            VStack{
                TabHeader(title: "Dashboard", isHome: true)
            }
            VStack{
                
            }
            .commonPadding()
        }
        .commonLayout()
        .commonBackground()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    HomeView().environmentObject(PatientViewModel())
}

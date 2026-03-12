//
//  HomeView.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-12.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var patientViewModel : PatientViewModel
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
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

//
//  HomeScrollableView.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-001 on 2026-03-10.
//

import SwiftUI
struct HomeScrollableView: View {
    @EnvironmentObject var patientViewModel: PatientViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 25) {
                
                // Greeting
                VStack(alignment: .leading, spacing: 4) {
                    Text("Good morning, Ashen")
                        .headerColor()
                        .font(.system(size: 28, weight: .bold))
                    Text("How are you feeling today?")
                        .subHeader2Color()
                        .font(.system(size: 16))
                }
                
                
            }
            .commonPadding()
            .padding(.top, 20)
            .padding(.bottom, 30)
        }
        .commonLayout()
        .commonBackground()
    }
    
}

//Mood selection
struct MoodGridView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyGrid(columns: columns, spacing: 15) {
            MoodItem(emoji: "")
        }
    }
}

struct MoodItem: View {
    let emogi: String
    let label: String
    let color
    
    var body: some View {
        VStack(spacing: 10) {
            Text(emoji)
                .font(.system(size: 32))
        }
    }
}

#Preview {
    HomeScrollableView()
}

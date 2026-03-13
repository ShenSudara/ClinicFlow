//
//  BookAppointmentView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-13.
//

import SwiftUI

struct BookAppointmentView: View {
    @StateObject private var viewModel = BookAppointmentViewModel()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack{
            AppHeader(title: "Book Appointment", showBackButton: true)

            VStack{
                BookAppointmentScrollView(viewModel: viewModel)
            }
            .commonBackground()
            
            VStack{
                Button(action: { viewModel.confirmAppointment(); dismiss() }) {
                    Text("Confirm Appointment")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.isConfirmEnabled ? Color("NPrimaryColor") : Color("IconBackground"))
                        .foregroundColor(viewModel.isConfirmEnabled ? .white : Color("SubHeader2"))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color("NPrimaryColor").opacity(0.1), lineWidth: 1)
                        )
                }
                .disabled(!viewModel.isConfirmEnabled)
            }
            .padding(.top, 15)
            .shadow(color: Color.black.opacity(0.01), radius: 2, x: 0, y: -4)
        }
        .commonLayout()
        .commonPadding()
        .commonBackground()
        .navigationBarHidden(true)
    }
}

#Preview {
    BookAppointmentView()
}

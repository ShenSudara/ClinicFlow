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
            AppHeader(title: "Book Appointment", showBackButton: true).commonPadding()

            VStack{
                BookAppointmentScrollView(viewModel: viewModel)
            }
            .commonBackground()
            .commonPadding()
            
            VStack{
                Divider()
                VStack{
                    Button(action: { viewModel.confirmAppointment() }) {
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
                    .commonPadding()
                    .disabled(!viewModel.isConfirmEnabled)
                }
                .padding(.vertical, 15)
            }.background(.white)
        }
        .commonLayout()
        .commonBackground()
        
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $viewModel.bookingSuccess) {
            BookAppointmentSuccessView(clinicName: viewModel.selectedClinic.isEmpty ? "" : viewModel.selectedClinic, date: viewModel.selectedDate, time: viewModel.selectedTimeSlot, tokenNumber: Int.random(in: 1...99)) {
                viewModel.bookingSuccess = false
                dismiss()
            }
        }
    }
}

#Preview {
    BookAppointmentView()
}

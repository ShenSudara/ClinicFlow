//
//  BookAppointmentScrollView.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-13.
//

import SwiftUI

struct BookAppointmentScrollView: View {
    @ObservedObject var viewModel: BookAppointmentViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Select Clinic")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.vertical,5)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 18) {
                            ForEach(viewModel.clinics) { clinic in
                                Button(action: {
                                    viewModel.selectedClinic = clinic.id
                                }) {
                                    VStack(alignment: .leading, spacing: 10) {
                                        Image(["clinic1", "clinic2", "clinic3"].randomElement()!)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(height: 90)
                                            .frame(maxWidth: .infinity)
                                            .clipped()
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(clinic.name)
                                                .font(.system(size: 16, weight: .semibold))
                                                .foregroundColor(.black)

                                            Text(clinic.address)
                                                .font(.system(size: 12))
                                                .foregroundColor(Color("SubHeader2"))
                                        }
                                        .padding(.horizontal, 10)
                                        .padding(.bottom, 10)
                                    }
                                    .frame(width: 180)
                                    .background(
                                        viewModel.selectedClinic == clinic.id
                                        ? Color("NPrimaryColor").opacity(0.12)
                                        : Color.white
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(
                                                viewModel.selectedClinic == clinic.id
                                                ? Color("NPrimaryColor")
                                                : Color.gray.opacity(0.2),
                                                lineWidth: viewModel.selectedClinic == clinic.id ? 2 : 1
                                            )
                                    )
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
                .padding(.vertical, 15)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Select Date")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)

                    DatePicker(
                        "",
                        selection: $viewModel.selectedDate,
                        in: Date()...,
                        displayedComponents: .date
                    )
                    .datePickerStyle(.graphical)
                    .tint(Color("NPrimaryColor"))
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray.opacity(0.15), lineWidth: 1)
                    )
                    .shadow(color: Color.black.opacity(0.05), radius: 6, x: 0, y: 2)
                }
                .padding(.bottom, 15)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Selected Date:")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color("SubHeader2"))

                    Text(dateHeader)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 6)
                        .background(
                            Capsule()
                                .fill(Color("NPrimaryColor"))
                                .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 2)
                        ).padding(.bottom, 15)
                    Text("Available Time")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)
                    Text("MORNING")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Color("SubHeader2"))
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 3), spacing: 12) {
                        ForEach(viewModel.morningSlots, id: \ .self) { slot in
                            slotButton(for: slot)
                        }
                    }
                    Text("AFTERNOON")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Color("SubHeader2"))
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 3), spacing: 12) {
                        ForEach(viewModel.afternoonSlots, id: \ .self) { slot in
                            slotButton(for: slot)
                        }
                    }
                }.padding(.bottom, 15)
            }
            .padding(.bottom, 30)
        }.scrollIndicators(.hidden)
    }

    //just a helper for time slot button
    private func slotButton(for slot: String) -> some View {
        let isSelected = viewModel.selectedTimeSlot == slot
        let isDisabled = viewModel.disabledSlots.contains(slot)
        return Button(action: {
            if !isDisabled {
                viewModel.selectedTimeSlot = slot
            }
        }) {
            Text(slot)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(
                    isDisabled
                    ? Color("SubHeader2")
                    : (isSelected ? .white : .black)
                )
                .frame(maxWidth: .infinity, minHeight: 42)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(
                            isDisabled
                            ? Color.gray.opacity(0.08)
                            : (isSelected ? Color("NPrimaryColor") : Color(.systemGray6))
                        )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(
                            isSelected
                            ? Color("NPrimaryColor")
                            : Color.gray.opacity(0.15),
                            lineWidth: 1
                        )
                )
        }
        .disabled(isDisabled)
        .buttonStyle(.plain)
    }

    private var dateHeader: String {
        let fmt = DateFormatter()
        fmt.dateFormat = "EEEE, MMM d"
        return fmt.string(from: viewModel.selectedDate)
    }
}

#Preview {
    BookAppointmentScrollView(viewModel: BookAppointmentViewModel())
}

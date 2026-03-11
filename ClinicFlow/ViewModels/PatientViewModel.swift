//
//  PatientViewModel.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-02-28.
//

import Foundation
import Combine

class PatientViewModel: ObservableObject {
    @Published var user: UserState = .unknown
    
    @Published var mobileNo: String = ""
    @Published var otpCode: String = ""
    @Published var inputOTPCode: String = ""
    @Published var patient: Patient = Patient(mobileNo: "")

    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var isOTPSent: Bool = false
    
    @Published var patients: [Patient] = [
        Patient(mobileNo: "0123456789")
    ]
    
    init(mobileNo: String = "") {
        self.mobileNo = mobileNo
    }
    
    func sendOTP()-> Bool {
        guard !mobileNo.isEmpty else {
            errorMessage = "Mobile number cannot be empty"
            return false
        }
        
        isLoading = true
        errorMessage = nil
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.isLoading = false
            self.isOTPSent = true
            self.otpCode = String(format: "%04d", Int.random(in: 1000...9999))
            print("OTP sent to \(self.mobileNo): \(self.otpCode)")
        }
        return true
    }
    
    func verifyOTP() -> Bool {
        guard isOTPSent else {
            errorMessage = "Please send OTP first"
            return false
        }
        guard otpCode == inputOTPCode else {
            errorMessage = "Invalid OTP"
            return false
        }
        
        isLoading = true
        errorMessage = nil
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.isLoading = false
            if let index = self.patients.firstIndex(where: { $0.mobileNo ==  self.mobileNo }) {
                self.patient = self.patients[index]
                self.user = .existing
            }else{
                self.patient = self.addPatient()
                self.user = .newUser
            }
        }
        
        return true
    }
    
    func register() {
        guard !patient.mobileNo.isEmpty else {
            errorMessage = "Mobile number cannot be empty"
            return
        }
        
        //name
        guard let name = patient.name, !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Name cannot be empty"
            return
        }
        //nic
        guard let nic = patient.nicNumber, !nic.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "NIC cannot be empty"
            return
        }
        
        //dob
        guard let dob = patient.dob else {
            errorMessage = "Date of birth cannot be empty"
            return
        }
        guard dob <= Date() else {
            errorMessage = "Date of birth cannot be in the future"
            return
        }
        
        //email
        guard let email = patient.email, !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Email cannot be empty"
            return
        }
        guard email.contains("@") else {
            errorMessage = "Please enter a valid email"
            return
        }
        
        //address
        guard let address = patient.address, !address.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Address cannot be empty"
            return
        }
        
        if let index = patients.firstIndex(where: { $0.mobileNo == mobileNo }) {
            errorMessage = nil
            patients[index] = patient
            reset()
        } else {
            errorMessage = "Patient not found. Please complete OTP verification first."
        }
    }
        
    func signOut(){
        reset()
    }
    
    
    //helpers
    private func addPatient()->Patient {
        let newPatient = Patient(mobileNo: mobileNo)
        patients.append(newPatient)
        return newPatient
    }
    
    private func reset(){
        mobileNo = ""
        otpCode = ""
        inputOTPCode = ""
        user = .unknown
        patient = Patient(mobileNo: "")
        isLoading = false
        errorMessage = nil
        isOTPSent = false
    }
    
}

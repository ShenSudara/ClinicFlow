//
//  OTPVerification.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-02-28.
//

struct OTPVerification {
    let userId: String
    let mobileNo: String
    var otpCode: Int?
    var isVerified: Bool = false

    init(userId: String, mobileNo: String, otpCode: Int? = nil, isVerified: Bool = false) {
        self.userId = userId
        self.mobileNo = mobileNo
        self.otpCode = otpCode
        self.isVerified = isVerified
    }
}

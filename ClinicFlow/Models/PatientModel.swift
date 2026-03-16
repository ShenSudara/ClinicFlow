//
//  Patient.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-02-28.
//

import Foundation

struct Patient: Identifiable{
    let id: String
    var mobileNo: String
    var name: String?
    var nicNumber: String?
    var dob: Date?
    var email: String?
    var address: String?
    
    init(
        id: String = UUID().uuidString,
        mobileNo: String,
        name: String? = nil,
        nicNumber: String? = nil,
        dob: Date? = nil,
        email: String? = nil,
        address: String? = nil
    ) {
        self.id = id
        self.mobileNo = mobileNo
        self.name = name
        self.nicNumber = nicNumber
        self.dob = dob
        self.email = email
        self.address = address
    }
}

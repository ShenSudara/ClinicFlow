//
//  ProfileField.swift
//  ClinicFlow
//
//  Created by Ashen Sudaraka on 2026-03-11.
//


enum EditProfileField: Identifiable {
    var id: Self { self }
    case name
    case nic
    case mobile
    case email
    case address
}

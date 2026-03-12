//
//  HomeScrollView.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-063 on 2026-03-12.
//

import SwiftUI

struct HomeScrollView: View {
    @StateObject var vm: HomeViewModel
    
    init(vm: HomeViewModel = HomeViewModel()) {
        _vm = StateObject(wrappedValue: vm)
    }

import SwiftUI

struct AppointmentsView: View {
    @StateObject private var vm = AppointmentsViewModel()
    @EnvironmentObject var patientViewModel: PatientViewModel

    var body: some View {
        VStack {
            TabHeader(title: "Appointments", isHome: false)
            
            VStack(spacing: 12) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search doctor or clinic", text: $vm.searchText)
                }
                .padding(10)
                .background(Color.white)
                .cornerRadius(12)
                .padding(.top, 15)

                Picker("Tab", selection: $vm.selectedTab) {
                    ForEach(AppointmentsViewModel.AppointmentTab.allCases) { tab in
                        Text(tab.rawValue).tag(tab)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.top, )

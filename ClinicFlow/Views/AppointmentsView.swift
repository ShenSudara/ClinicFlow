import SwiftUI

struct AppointmentsView: View {
    @StateObject private var vm = AppointmentsViewModel()
    @EnvironmentObject var patientViewModel: PatientViewModel
    @State private var showingBook = false

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
                
                
                ScrollView {
                                    VStack(alignment: .leading, spacing: 12) {
                                        if vm.selectedTab == .upcoming {
                                            Group {
                                                Text("Today")
                                                    .font(.system(size: 14, weight: .bold))
                                                    .foregroundColor(Color("SubHeader2"))
                                                ForEach(vm.filteredUpcoming) { appt in
                                                    NavigationLink(destination: AppointmentDetailsView().environmentObject(patientViewModel)) {
                                                        AppointmentsCardView(appointment: appt)
                                                    }
                                                    .buttonStyle(PlainButtonStyle())
                                                }
                                            }
                                        } else if vm.selectedTab == .past {
                                            Text("Last Week")
                                                .font(.system(size: 14, weight: .bold))
                                                .foregroundColor(Color("SubHeader2"))
                                            ForEach(vm.filteredPast) { appt in
                                                NavigationLink(destination: AppointmentDetailsView().environmentObject(patientViewModel)) {
                                                    AppointmentsCardView(appointment: appt)
                                                }
                                                .buttonStyle(PlainButtonStyle())
                                            }
                                        } else {
                                            Text("Cancelled")
                                                .font(.system(size: 14, weight: .bold))
                                                .foregroundColor(Color("SubHeader2"))
                                            ForEach(vm.filteredCancelled) { appt in
                                                NavigationLink(destination: AppointmentDetailsView().environmentObject(patientViewModel)) {
                                                    AppointmentsCardView(appointment: appt)
                                                }
                                                .buttonStyle(PlainButtonStyle())
                                            }
                                        }
                                    }
                                    .padding(.vertical, 8)
                                }
                                .background(Color("Background"))
                                .cornerRadius(12)
                                Spacer()
                            }.commonPadding()
                    VStack(alignment: .trailing) {
                            Button {
                                showingBook = true
                            } label: {
                                ZStack {
                                    Circle()
                                        .fill(Color("NPrimaryColor"))
                                        .frame(width: 56, height: 56)
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .bold))
                                }
                            }
                            .padding()
                            .padding(.trailing, 16)
                            .fullScreenCover(isPresented: $showingBook) {
                                BookAppointmentView()
                            }
                       }.frame(maxWidth: .infinity, alignment: .bottomTrailing)
                   }
                   .commonLayout()
                   .commonBackground()
                   .navigationBarHidden(true)
                   .navigationBarBackButtonHidden(true)
               }
           }

           #Preview {
               NavigationStack {
                   AppointmentsView().environmentObject(PatientViewModel())
               }
           }

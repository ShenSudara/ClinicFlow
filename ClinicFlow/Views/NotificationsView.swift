import SwiftUI

struct NotificationsView: View {
    @EnvironmentObject var patientViewModel: PatientViewModel
    @StateObject private var vm = NotificationViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            TabHeader(title: "Notifications", isHome: false)
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading, spacing: 0) {
                    if !vm.today.isEmpty {
                        Text("Today")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(Color("SubHeader2"))
                            .padding(.vertical, 5)
                            .commonPadding()
                        VStack(spacing: 0){
                            ForEach(vm.today) { item in
                                NotificationCardView(item: item) { tapped in
                                    vm.markAsRead(tapped.id)
                                }
                            }
                        }
                    }
                    
                    if !vm.yesterday.isEmpty {
                        Text("Yesterday")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(Color("SubHeader2"))
                            .padding(.vertical, 5)
                            .commonPadding()
                        VStack(spacing: 0){
                            ForEach(vm.yesterday) { item in
                                NotificationCardView(item: item) { tapped in
                                    vm.markAsRead(tapped.id)
                                }
                            }
                        }
                    }
                    
                    if !vm.other.isEmpty {
                        Text("Last week")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(Color("SubHeader2"))
                            .padding(.vertical, 5)
                            .commonPadding()
                        VStack{
                            ForEach(vm.other) { item in
                                NotificationCardView(item: item) { tapped in
                                    vm.markAsRead(tapped.id)
                                }
                            }
                        }
                    }
                }.padding(.vertical, 20)
            }.scrollIndicators(.hidden)
        }
        .commonLayout()
        .commonBackground()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NotificationsView().environmentObject(PatientViewModel())
}

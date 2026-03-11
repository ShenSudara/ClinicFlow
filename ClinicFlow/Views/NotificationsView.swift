import SwiftUI

struct NotificationsView: View {
    @EnvironmentObject var patientViewModel: PatientViewModel
    
    var body: some View {
        ZStack{
            VStack{
                TabHeader(title: "Notifications", isHome: true)
            }
            VStack{
                
            }
            .commonPadding()
        }
        .commonLayout()
        .commonBackground()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    NotificationsView().environmentObject(PatientViewModel())
}

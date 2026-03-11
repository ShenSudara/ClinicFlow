import SwiftUI

struct NotificationsView: View {
    @EnvironmentObject var patientViewModel: PatientViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("This is Notification View.")

        }
        .commonLayout()
        .commonPadding()
        .commonBackground()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    NotificationsView().environmentObject(PatientViewModel())
}

import SwiftUI

struct AppointmentsView: View {
    @EnvironmentObject var patientViewModel: PatientViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("This is Appointments View.")

        }
        .commonLayout()
        .commonPadding()
        .commonBackground()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    AppointmentsView().environmentObject(PatientViewModel())
}

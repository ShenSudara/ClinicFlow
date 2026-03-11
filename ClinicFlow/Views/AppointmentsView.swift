import SwiftUI

struct AppointmentsView: View {
    @EnvironmentObject var patientViewModel: PatientViewModel
    
    var body: some View {
        ZStack{
            VStack{
                TabHeader(title: "Appointments", isHome: true)
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
    AppointmentsView().environmentObject(PatientViewModel())
}

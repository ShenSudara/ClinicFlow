import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var patientViewModel: PatientViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("This is Profile View")

        }
        .commonLayout()
        .commonPadding()
        .commonBackground()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    ProfileView().environmentObject(PatientViewModel())
}

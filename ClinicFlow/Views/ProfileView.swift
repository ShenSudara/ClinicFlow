import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var patientViewModel: PatientViewModel
    
    var body: some View {
        ZStack{
            VStack{
                TabHeader(title: "Profile", isHome: true)
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
    ProfileView().environmentObject(PatientViewModel())
}

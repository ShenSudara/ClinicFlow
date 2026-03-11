import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var patientViewModel: PatientViewModel
    @EnvironmentObject var appViewModel: AppViewModel
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            .tag(0)
            
            NavigationStack {
                AppointmentsView()
            }
            .tabItem {
                Image(systemName: "calendar")
                Text("Appointments")
            }
            .tag(1)
            
            NavigationStack {
                NotificationsView()
            }
            .tabItem {
                Image(systemName: "bell")
                Text("Notifications")
            }
            .tag(2)
            
            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
            .tag(3)
        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(PatientViewModel())
        .environmentObject(AppViewModel())
}

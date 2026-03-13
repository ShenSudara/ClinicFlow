import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var patientViewModel: PatientViewModel
    @EnvironmentObject var appViewModel: AppViewModel
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
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
        .onAppear {
            selection = appViewModel.selectedTab
        }
        .onChange(of: selection) { new in
            if appViewModel.selectedTab != new {
                appViewModel.selectedTab = new
            }
        }
        .onChange(of: appViewModel.selectedTab) { new in
            if selection != new {
                selection = new
            }
        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(PatientViewModel())
        .environmentObject(AppViewModel())
}

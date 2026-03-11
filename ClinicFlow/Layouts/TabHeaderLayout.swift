import SwiftUI

struct TabHeader: View {
    let title: String
    var isHome: Bool = false
    @EnvironmentObject var patientViewModel: PatientViewModel
    @State private var showProfileSheet: Bool = false
    
    var body: some View {
        HStack{
            HStack {
                Text(title)
                    .headerColor()
                    .font(.system(size: 24, weight: .bold))
                Spacer()
                Button(action: {
                    showProfileSheet = true
                }) {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                        .foregroundColor(Color("NPrimaryColor"))
                }
            }
            .commonPadding()
        }
        .padding(.top, 40)
        .padding(.bottom, 15)
        .background(.white)
        .sheet(isPresented: $showProfileSheet) {
            ProfileSwitchSheet()
                .environmentObject(patientViewModel)
                .presentationDetents([.medium, .large])
        }
    }
}

struct ProfileSwitchSheet: View {
    @EnvironmentObject var patientViewModel: PatientViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 12) {
            Capsule()
                .fill(Color.secondary)
                .frame(width: 40, height: 5)
                .padding(.top, 8)
            Text("Switch Profile")
                .font(.headline)
                .padding(.top, 4)
            Divider()
            if patientViewModel.patients.isEmpty {
                Spacer()
                Text("No profiles available")
                    .foregroundColor(.secondary)
                Spacer()
            } else {
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(patientViewModel.patients.indices, id: \.self) { idx in
                            let p = patientViewModel.patients[idx]
                            Button(action: {
                                patientViewModel.patient = p
                                dismiss()
                            }) {
                                HStack(spacing: 12) {
                                    Image(systemName: "person.crop.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 44, height: 44)
                                        .foregroundColor(.blue)
                                        .padding(6)
                                        .background(Color("IconBackground"))
                                        .clipShape(Circle())
                                    VStack(alignment: .leading) {
                                        Text((p.name?.isEmpty == false ? p.name : p.mobileNo) ?? "")
                                            .font(.headline)
                                            .foregroundColor(.primary)
                                        Text(roleForIndex(idx))
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    Spacer()
                                }
                                .padding(.vertical, 8)
                                .padding(.horizontal, 6)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .background(Color.white)
                            .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 24)
                }
            }
        }
        .background(.white)
    }
    
    private func roleForIndex(_ idx: Int) -> String {
        switch idx {
            case 0: return "Elder"
            case 1: return "Child"
            default: return "Me"
        }
    }
}

#Preview {
    TabHeader(title: "Home", isHome: true)
        .environmentObject(PatientViewModel())
}

import SwiftUI

struct ServiceDetailsView: View {
    @StateObject private var vm: ServiceDetailsViewModel

    init(service: ServiceItem? = nil) {
        if let service = service {
            _vm = StateObject(wrappedValue: ServiceDetailsViewModel(service: service))
        } else {
            let sample = ServiceItem(serviceName: "Consultation", status: .completed, room: "Room 302", time: "8:30 AM", type: .doctor)
            _vm = StateObject(wrappedValue: ServiceDetailsViewModel(service: sample))
        }
    }

    var body: some View {
        VStack{
            AppHeader(title: "Service Details", showBackButton: true)
            ScrollView {
                VStack(spacing: 16) {
                    VStack(spacing: 24) {
                        VStack{
                            HStack(alignment: .bottom, spacing: 4) {
                                Text("\(vm.tokenNumber)")
                                    .font(.system(size: 48, weight: .bold))
                                    .foregroundColor(Color("NPrimaryColor"))
                                Text("token")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.secondary)
                                    .padding(.bottom, 10)
                            }
                            Spacer()
                            HStack(spacing: 6) {
                                Image(systemName: "clock.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                                Text(vm.appointmentTime)
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 14)
                            .padding(.vertical, 6)
                            .background(Color("NPrimaryColor"))
                            .clipShape(Capsule())
                            .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
                        }
                        VStack(spacing: 18) {
                            Image("qr")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 140, height: 140)
                                .foregroundColor(.gray)
                            Text("Scan at reception counter")
                                .font(.system(size: 14))
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                    }
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.04), radius: 4, x: 0, y: 2)
                    .padding(.top, 30)

                    ServiceDetailsCardView(serviceName: vm.serviceName, serviceLocation: vm.serviceLocation, doctorName: vm.doctorName)

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Location")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)

                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.gray.opacity(0.12))
                                .frame(height: 160)

                            Image("map")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 160)
                                .clipped()
                                .cornerRadius(12)
                        }

                        HStack(spacing: 12) {
                            Button(action: {}) {
                                HStack {
                                    Image(systemName: "arrow.triangle.turn.up.right.circle.fill")
                                    Text("Get Directions")
                                        .font(.system(size: 14, weight: .bold))
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                )
                            }

                            Button(action: {}) {
                                HStack {
                                    Image(systemName: "location.fill.viewfinder")
                                    Text("Indoor Nav")
                                        .font(.system(size: 14, weight: .bold))
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                )
                            }
                        }
                    }
                    .padding(16)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.04), radius: 4, x: 0, y: 2)

                    Spacer(minLength: 32)
                }
                .padding(.top, 8)
            }.scrollIndicators(.hidden)
        }
        .commonLayout()
        .commonPadding()
        .commonBackground()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        ServiceDetailsView(service: ServiceItem(serviceName: "Consultation", status: .completed, room: "Room 302", time: "8:30 AM", type: .doctor))
    }
}

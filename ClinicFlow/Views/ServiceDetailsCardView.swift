import SwiftUI

struct ServiceDetailsCardView: View {
    let serviceName: String
    let serviceLocation: String
    let doctorName: String

    private var doctorInitials: String {
        let parts = doctorName.split(separator: " ")
        let letters = parts.prefix(2).compactMap { $0.first.map { String($0) } }
        return letters.joined().uppercased()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Service Details")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)

            Divider()

            HStack(spacing: 12) {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.purple.opacity(0.12))
                        .frame(width: 44, height: 44)
                    Image(systemName: "heart.fill")
                        .foregroundColor(.purple)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(serviceName)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(serviceLocation)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Spacer()
            }
            

            Divider()

            HStack(alignment: .center, spacing: 12) {
                ZStack {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 40, height: 40)
                    Text(doctorInitials)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text("Doctor")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(doctorName)
                        .font(.subheadline)
                        .fontWeight(.bold)
                }

                Spacer()

                Button(action: {}) {
                    Image(systemName: "info.circle")
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                }
            }
            
            Divider()
            
            NavigationLink(destination: ClinicInstructionView(instructionName: serviceName, roomNumber: serviceLocation)) {
                HStack(spacing: 12) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("NPrimaryColor").opacity(0.12))
                            .frame(width: 44, height: 44)
                        Image(systemName: "checklist")
                            .foregroundColor(Color("NPrimaryColor"))
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Preparation Instruction")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Text("Follow the instructions")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                    Spacer()
                }
            }
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.04), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    ServiceDetailsCardView(serviceName: "Consultation", serviceLocation: "Room 302", doctorName: "Dr. Ashen Sudaraka")
        .padding()
        .background(Color(.systemGroupedBackground))
}

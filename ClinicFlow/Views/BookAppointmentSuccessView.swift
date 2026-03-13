import SwiftUI

struct BookAppointmentSuccessView: View {
    let clinicName: String
    let date: Date
    let time: String
    let tokenNumber: Int
    var onDone: (() -> Void)?

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(systemName: "checkmark.seal.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 84, height: 84)
                .foregroundColor(Color("NPrimaryColor"))
            Text("Appointment Booked")
                .font(.system(size: 24, weight: .bold))
            Text("Your appointment has been successfully booked.")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal, 24)

            VStack(spacing: 8) {
                HStack {
                    Text("Clinic")
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(clinicName).bold()
                }
                HStack {
                    Text("Date")
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(dateString(date)).bold()
                }
                HStack {
                    Text("Time")
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(time).bold()
                }
                HStack {
                    Text("Token")
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("#\(tokenNumber)").bold()
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.04), radius: 4, x: 0, y: 2)
            .padding(.horizontal, 16)

            Spacer()

            Button(action: { onDone?() }) {
                Text("Done")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("NPrimaryColor"))
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal, 16)
            }
            .padding(.bottom, 30)
        }
        .commonLayout()
        .commonBackground()
    }

    private func dateString(_ date: Date) -> String {
        let df = DateFormatter()
        df.dateStyle = .medium
        return df.string(from: date)
    }
}

#Preview {
    BookAppointmentSuccessView(clinicName: "City Health Clinic", date: Date(), time: "10:30 AM", tokenNumber: 12)
}

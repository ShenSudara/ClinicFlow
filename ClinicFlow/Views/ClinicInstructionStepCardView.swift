import SwiftUI

struct ClinicInstructionStepCardView: View {
    let step: ClinicInstructionStep
    let currentIndex: Int
    let totalSteps: Int

    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                if let uiImage = UIImage(named: step.imageName) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .clipped()
                        .cornerRadius(12)
                } else {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray5))
                        .frame(height: 300)
                        .overlay(
                            Image(systemName: "photo")
                                .font(.system(size: 36))
                                .foregroundColor(.secondary)
                        )
                }
            }
            VStack(alignment: .leading, spacing: 6) {
                Text(step.instructionTitle)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(step.instructionDescription)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }.frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Spacer()
                Text("Step \(currentIndex + 1) of \(totalSteps)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 2)
    }
}

struct ClinicInstructionStepCardView_Previews: PreviewProvider {
    static var previews: some View {
        ClinicInstructionStepCardView(step: ClinicInstructionStep(imageName: "entrance", instructionTitle: "Arrive at Reception", instructionDescription: "Check in and collect your token."), currentIndex: 0, totalSteps: 3)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

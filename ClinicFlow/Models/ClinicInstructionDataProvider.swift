import Foundation

struct ClinicInstructionDataProvider {
    static func steps(for instructionName: String, room: String) -> [ClinicInstructionStep] {
        let lower = instructionName.lowercased()
        if lower.contains("consult") || lower.contains("consultation") {
            return [
                ClinicInstructionStep(imageName: "ConsultationP1", instructionTitle: "Bring Your Medical Records", instructionDescription: "It is important to bring any relevant past medical records, test results, or referral letters to your consultation."),
                ClinicInstructionStep(imageName: "ConsultationP2", instructionTitle: "List of Current Medications", instructionDescription: "Please bring a complete list of all the medications you are currently taking, including their names and dosages."),
                ClinicInstructionStep(imageName: "ConsultationP3", instructionTitle: "Write Down Symptoms", instructionDescription: "To make the most of your visit, write down your symptoms and any questions you have for the doctor beforehand."),
                ClinicInstructionStep(imageName: "ConsultationP4", instructionTitle: "Arrive 15 Minutes Early", instructionDescription: "Plan to arrive at the clinic at least 15 minutes before your scheduled appointment time to complete any necessary paperwork.")
            ]
        }
        if lower.contains("pharmacy") || lower.contains("drug") {
            return [
                ClinicInstructionStep(imageName: "entrance", instructionTitle: "Enter Pharmacy Area", instructionDescription: "Proceed to the pharmacy counter near reception."),
                ClinicInstructionStep(imageName: "left_turn", instructionTitle: "Turn Left After Desk", instructionDescription: "Turn left past the info desk and continue straight."),
                ClinicInstructionStep(imageName: "pharmacy", instructionTitle: "Collect Medication", instructionDescription: "Collect your prescribed medication at the pharmacy window.")
            ]
        }
        return [
            ClinicInstructionStep(imageName: "entrance", instructionTitle: "Enter Building", instructionDescription: "Start at the main entrance."),
            ClinicInstructionStep(imageName: "desk", instructionTitle: "Check In", instructionDescription: "Check in at reception for directions."),
            ClinicInstructionStep(imageName: "room", instructionTitle: "Proceed to \(room)", instructionDescription: "Follow signage to reach your room.")
        ]
    }
}

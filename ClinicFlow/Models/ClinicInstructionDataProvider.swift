import Foundation

struct ClinicInstructionDataProvider {
    static func steps(for instructionName: String, room: String) -> [ClinicInstructionStep] {
        let lower = instructionName.lowercased()
        if lower.contains("consult") || lower.contains("consultation") {
            return [
                ClinicInstructionStep(imageName: "entrance", instructionTitle: "Arrive at Reception", instructionDescription: "Check in and collect your instruction token."),
                ClinicInstructionStep(imageName: "elevator", instructionTitle: "Proceed to Floor 3", instructionDescription: "Use the elevators near reception to reach the outpatient floor."),
                ClinicInstructionStep(imageName: "hallway", instructionTitle: "Follow Signs", instructionDescription: "Follow the green signs to the consultation wing."),
                ClinicInstructionStep(imageName: "room", instructionTitle: "Enter \(room)", instructionDescription: "Wait in the consultation room until called.")
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

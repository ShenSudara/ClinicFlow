import Foundation

struct ClinicInstructionStep: Identifiable {
    let id: UUID
    var imageName: String
    var instructionTitle: String
    var instructionDescription: String

    init(id: UUID = UUID(), imageName: String, instructionTitle: String, instructionDescription: String) {
        self.id = id
        self.imageName = imageName
        self.instructionTitle = instructionTitle
        self.instructionDescription = instructionDescription
    }
}

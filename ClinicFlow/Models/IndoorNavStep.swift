import Foundation

struct IndoorNavStep: Identifiable {
    let id: UUID
    var imageName: String
    var stepTitle: String
    var stepDescription: String

    init(id: UUID = UUID(), imageName: String, stepTitle: String, stepDescription: String) {
        self.id = id
        self.imageName = imageName
        self.stepTitle = stepTitle
        self.stepDescription = stepDescription
    }
}

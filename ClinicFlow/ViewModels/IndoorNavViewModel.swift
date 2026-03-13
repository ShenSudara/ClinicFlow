import Foundation
import SwiftUI
import Combine

class IndoorNavViewModel: ObservableObject {
    @Published private(set) var steps: [IndoorNavStep] = []
    @Published var currentStepIndex: Int = 0

    let serviceName: String
    let roomNumber: String

    init(serviceName: String, roomNumber: String) {
        self.serviceName = serviceName
        self.roomNumber = roomNumber
        self.loadSteps()
    }

    private func loadSteps() {
        steps = IndoorNavDataProvider.steps(for: serviceName, room: roomNumber)
        currentStepIndex = 0
    }

    var currentStep: IndoorNavStep? {
        guard steps.indices.contains(currentStepIndex) else { return nil }
        return steps[currentStepIndex]
    }

    var totalSteps: Int { steps.count }
    var isFirstStep: Bool { currentStepIndex == 0 }
    var isLastStep: Bool { currentStepIndex == max(0, steps.count - 1) }
    var progressValue: Double { guard totalSteps > 0 else { return 0.0 }; return Double(currentStepIndex + 1) / Double(totalSteps) }
    var stepLabel: String { "STEP \(min(currentStepIndex + 1, totalSteps)) OF \(totalSteps)" }

    func nextStep() {
        guard currentStepIndex < max(0, steps.count - 1) else { return }
        withAnimation { currentStepIndex += 1 }
    }

    func previousStep() {
        guard currentStepIndex > 0 else { return }
        withAnimation { currentStepIndex -= 1 }
    }
}

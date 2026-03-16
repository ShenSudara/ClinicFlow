import Foundation

struct IndoorNavDataProvider {
    static func steps(for serviceName: String, room: String) -> [IndoorNavStep] {
        let lower = serviceName.lowercased()
        if lower.contains("consult") || lower.contains("consultation") {
            return [
                IndoorNavStep(imageName: "Consultation1", stepTitle: "Enter Main Lobby", stepDescription: "Proceed through the main doors and check in at reception."),
                IndoorNavStep(imageName: "Consultation2", stepTitle: "Take Elevator", stepDescription: "Take the elevator to the 3rd floor; follow signs for Outpatient."),
                IndoorNavStep(imageName: "Consultation3", stepTitle: "Follow Corridor", stepDescription: "Walk along the corridor and turn left at the blue signage."),
                IndoorNavStep(imageName: "Consultation4", stepTitle: "Arrive at \(room)", stepDescription: "The doctor will see you in the consultation room.")
            ]
        }
        if lower.contains("Payment") || lower.contains("creditcard") {
            return [
                IndoorNavStep(imageName: "Pharmacy1", stepTitle: "Enter Main Lobby", stepDescription: "Proceed to the pharmacy counter near reception."),
                IndoorNavStep(imageName: "Pharmacy2", stepTitle: "Turn Left", stepDescription: "Turn left after the info desk and continue straight."),
                IndoorNavStep(imageName: "Pharmacy3", stepTitle: "Payment Counter", stepDescription: "Collect your medication at the pharmacy window.")
            ]
        }
        return [
            IndoorNavStep(imageName: "Consultation1", stepTitle: "Enter Building", stepDescription: "Start at the main entrance."),
            IndoorNavStep(imageName: "Consultation2", stepTitle: "Check In", stepDescription: "Check in at reception for directions."),
            IndoorNavStep(imageName: "Consultation3", stepTitle: "Proceed to \(room)", stepDescription: "Follow signage to reach your room.")
        ]
    }
}

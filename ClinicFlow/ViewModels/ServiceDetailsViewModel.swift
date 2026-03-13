import Foundation
import SwiftUI
import Combine

class ServiceDetailsViewModel: ObservableObject {
    @Published var tokenNumber: Int = Int.random(in: 100...999)
    @Published var appointmentTime: String = {
        let df = DateFormatter()
        df.dateFormat = "h:mm a"
        return df.string(from: Date().addingTimeInterval(15 * 60))
    }()
    @Published var serviceName: String = "General Consultation"
    @Published var serviceLocation: String = "Room 302, Clinic A"
    @Published var doctorName: String = "Dr. Ashen Sudaraka"
    @Published var locationName: String = "Main Building - 3rd Floor"

    init() {}
}

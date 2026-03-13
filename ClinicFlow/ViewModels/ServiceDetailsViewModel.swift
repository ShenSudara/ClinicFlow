import Foundation
import SwiftUI
import Combine

@MainActor
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

    init(service: ServiceItem) {
        self.serviceName = service.serviceName
        self.serviceLocation = service.room
        self.doctorName = "Dr. " + service.serviceName
        self.appointmentTime = service.time
        self.locationName = "Clinic - " + service.room
    }
}

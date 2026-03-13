import SwiftUI

struct IndoorNavView: View {
    @StateObject private var vm: IndoorNavViewModel

    init(serviceName: String, roomNumber: String) {
        _vm = StateObject(wrappedValue: IndoorNavViewModel(serviceName: serviceName, roomNumber: roomNumber))
    }

    var body: some View {
        VStack(spacing: 0) {
            AppHeader(title: "Indoor Navigation", showBackButton: true)
            
            VStack(alignment: .leading, spacing: 12) {
                Text(vm.serviceName)
                    .font(.title3)
                    .bold()
                    .padding(.top, 30)
                Text("Room \(vm.roomNumber)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                ProgressView(value: vm.progressValue) {
                    Text(vm.stepLabel)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .progressViewStyle(LinearProgressViewStyle(tint: Color.accentColor))
                
                Spacer().frame(height: 8)
                
                if let step = vm.currentStep {
                    IndoorNavStepCardView(step: step, currentIndex: vm.currentStepIndex, totalSteps: vm.totalSteps)
                        .transition(.asymmetric(insertion: .move(edge: .trailing).combined(with: .opacity), removal: .move(edge: .leading).combined(with: .opacity)))
                }
                Spacer()
                HStack(spacing: 12) {
                    if vm.isFirstStep {
                        Button(action: {
                            
                        }) {
                            Text("Exit")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(.systemGray5))
                                .cornerRadius(10)
                        }
                        Button(action: { vm.nextStep() }) {
                            Text("Next")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.accentColor)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    } else if vm.isLastStep {
                        Button(action: { vm.previousStep() }) {
                            Text("Previous")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(.systemGray5))
                                .cornerRadius(10)
                        }
                        Button(action: {
                            
                        }) {
                            Text("Finish")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.accentColor)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    } else {
                        Button(action: { vm.previousStep() }) {
                            Text("Previous")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(.systemGray5))
                                .cornerRadius(10)
                        }
                        Button(action: { vm.nextStep() }) {
                            Text("Next")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.accentColor)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
        .commonLayout()
        .commonPadding()
        .commonBackground()
    }
}

struct IndoorNavView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            IndoorNavView(serviceName: "Consultation", roomNumber: "Room 302")
        }
    }
}

import SwiftUI

struct ClinicInstructionView: View {
    @StateObject private var vm: ClinicInstructionViewModel

    init(instructionName: String, roomNumber: String) {
        _vm = StateObject(wrappedValue: ClinicInstructionViewModel(instructionName: instructionName, roomNumber: roomNumber))
    }

    var body: some View {
        VStack(spacing: 0) {
            AppHeader(title: "Instructions", showBackButton: true)
            VStack(alignment: .leading, spacing: 12) {
                Text(vm.instructionName)
                    .font(.title3)
                    .bold()
                    .padding(.top, 30)
                Text("Please follows the instructions below")
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
                    ClinicInstructionStepCardView(step: step, currentIndex: vm.currentStepIndex, totalSteps: vm.totalSteps)
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
            .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        }
        .commonLayout()
        .commonPadding()
        .commonBackground()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct ClinicInstructionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ClinicInstructionView(instructionName: "Consultation", roomNumber: "Room 302")
        }
    }
}

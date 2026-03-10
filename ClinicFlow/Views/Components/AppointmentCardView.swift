//
//  AppointmentCardView.swift
//  ClinicFlow
//
//  Created by COBSCCOMP242P-001 on 2026-03-10.
//

struct AppointmentCardView: View {
    let name: String
    let type: String
    let date: String
    let time: String
    let status: String
    let statusColor: Color
    
    var body: some View {
        HStack(spacing: 15) {
            VStack {
                Text(date.components(separatedBy: " ")[0])
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.orange)
                Text(date.components(separatedBy: " ")[1])
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.orange)
            }
            .frame(width: 60, height: 60)
            .background(Color.orange.opacity(0.1))
            .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(name)
                        .headerColor()
                        .font(.system(size: 16, weight: .bold))
                    Spacer()
                    Text(time)
                        .subHeader2Color()
                        .font(.system(size: 12))
                }
                Text(type)
                    .subHeader2Color()
                    .font(.system(size: 14))
                
                Text(status)
                    .font(.system(size: 10, weight: .bold))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(statusColor.opacity(0.1))
                    .foregroundColor(statusColor)
                    .cornerRadius(5)
            }
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.03), radius: 10, x: 0, y: 5)
    }
}

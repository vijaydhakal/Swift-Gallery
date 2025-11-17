//
//  WorkoutInfoCard.swift
//  Fitness
//
//  Created by Vijay Dhakal on 13/11/25.
//

import SwiftUI

struct InfoCardView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            
            Image(systemName: "heart.fill")
                .font(.title3)
                .foregroundColor(.green)
                .padding(10)
                .background(Color.green.opacity(0.2).clipShape(Circle()))
            
            Text("To track other workout types, connect Apple Watch, AirPods with heart rate detection or a device with a heart rate sensor.")
                .font(.footnote)
                .foregroundColor(.primary)
            
            Spacer()
            
            Button(action: {
                
            }) {
                Image(systemName: "xmark")
                    .font(.caption.bold())
                    .foregroundColor(.secondary)
                    .padding(6)
                    .background(Color(UIColor.tertiarySystemBackground).clipShape(Circle()))
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(20)
    }
}

#Preview {
    VStack {
        InfoCardView()
            .padding()
        
        InfoCardView()
            .padding()
            .preferredColorScheme(.dark)
    }
}

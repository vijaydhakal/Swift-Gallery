//
//  WorkoutActionButtons.swift
//  Fitness
//
//  Created by Vijay Dhakal on 13/11/25.
//
import SwiftUI

struct WorkoutActionButton: View {
    let iconName: String
    
    var body: some View {
        Button(action: {
            
        }) {
            Image(systemName: iconName)
                .font(.callout.weight(.medium))
            
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(.thickMaterial)
                .cornerRadius(16)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack(spacing: 20) {
        
        HStack {
            WorkoutActionButton(iconName: "ellipsis")
            WorkoutActionButton(iconName: "rectangle.grid.1x2")
        }
        .padding()
        .background(Color.green.opacity(0.2))
        .foregroundColor(.green)
        HStack {
            WorkoutActionButton(iconName: "ellipsis")
            WorkoutActionButton(iconName: "rectangle.grid.1x2")
        }
        .padding()
        .background(Color(red: 26/255, green: 51/255, blue: 28/255))
        .foregroundColor(Color(red: 115/255, green: 255/255, blue: 100/255))
        .preferredColorScheme(.dark)
        
    }
    .padding()
    .background(Color(UIColor.systemGroupedBackground))
}

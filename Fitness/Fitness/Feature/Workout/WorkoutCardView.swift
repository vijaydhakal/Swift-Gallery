//
//  WorkoutCardView.swift
//  Fitness
//
//  Created by Vijay Dhakal on 13/11/25.
//

import SwiftUI

struct WorkoutCardView: View {
    let iconName: String
    let title: String
    let color: Color
    
    @Environment(\.colorScheme) var colorScheme
    static let darkGreen = Color(red: 26/255, green: 51/255, blue: 28/255)
    static let neonGreen = Color(red: 115/255, green: 255/255, blue: 100/255)
    
    var lightModeBackground: Color {
        color.opacity(0.2)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            HStack(alignment: .top) {
                Image(systemName: iconName)
                    .font(.system(size: 32))
                    .foregroundColor(color)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image(systemName: "play.fill")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(12)
                        .background(color.clipShape(Circle()))
                }
            }
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            HStack(spacing: 12) {
                WorkoutActionButton(iconName: "ellipsis")
                WorkoutActionButton(iconName: "rectangle.grid.1x2")
                WorkoutActionButton(iconName: "arrow.clockwise")
            }
        }
        .padding()
        .background(colorScheme == .dark ? Self.darkGreen : lightModeBackground)
        .foregroundColor(colorScheme == .dark ? Self.neonGreen : color)
        .cornerRadius(20)
        
    }
}


#Preview {
    VStack(spacing: 20) {
        WorkoutCardView(
            iconName: "figure.walk",
            title: "Outdoor Walk (Light)",
            color: .green
        )
        
        WorkoutCardView(
            iconName: "figure.run",
            title: "Outdoor Run (Dark)",
            color: .green
        )
        .preferredColorScheme(.dark)
    }
    .padding()
    .background(Color(UIColor.systemGroupedBackground))
}

//
//  WorkoutView.swift
//  Fitness
//
//  Created by Vijay Dhakal on 13/11/25.
//

import SwiftUI

struct WorkoutView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    
                    InfoCardView()
                    
                    WorkoutCardView(
                        iconName: "figure.walk",
                        title: "Outdoor Walk",
                        color: .green
                    )
                    
                    WorkoutCardView(
                        iconName: "figure.run",
                        title: "Outdoor Run",
                        color: .green
                    )
                    
                    Spacer()
                }
                .padding(.horizontal)
            }.background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
                .navigationTitle("Workout")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            
                        }) {
                            Image(systemName: "bell.slash.fill")
                                .font(.callout)
                                .foregroundColor(.secondary)
                                .padding(8)
                                .background(Color(UIColor.secondarySystemBackground).clipShape(Circle()))
                        }
                    }
                }
        }
    }
}

#Preview {
    WorkoutView()
}

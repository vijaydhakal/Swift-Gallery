//
//  DashboardView.swift
//  Fitness
//
//  Created by Vijay Dhakal on 10/11/25.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        TabView {
            SummaryView()
                .tabItem {
                    Image(systemName: "circle")
                    Text("Summary")
                }
            
            WorkoutView()
                .tabItem {
                    Image(systemName: "figure.run")
                    Text("Workout")
                }
            
            SharingView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Sharing")
                }
        }
        .tint(.green)
    }
}

#Preview {
    DashboardView()
}

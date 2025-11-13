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
            
            Text("Workout Screen")
                .tabItem {
                    Image(systemName: "figure.run")
                    Text("Workout")
                }
            
            Text("Sharing Screen")
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

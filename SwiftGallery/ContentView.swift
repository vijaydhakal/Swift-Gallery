//
//  ContentView.swift
//  SwiftGallery
//
//  Created by Vijay Dhakal on 02/11/25.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationStack {
            
            List {
                Section(header: Text("HTA App").font(.headline)) {
                    NavigationLink(destination: HTASplashScreen()) {
                        Label("Splash Screen", systemImage: "water.waves")
                    }
                    NavigationLink(destination: HTAOnboardingView()) {
                        Label("Onboarding Screen", systemImage: "questionmark.circle")
                    }
                }
                
                
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Swift Gallery")
        }
    }
}


#Preview {
    ContentView()
}

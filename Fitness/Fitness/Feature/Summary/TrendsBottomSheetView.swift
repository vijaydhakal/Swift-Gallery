//
//  TrendsBottomSheet.swift
//  Fitness
//
//  Created by Vijay Dhakal on 12/11/25.
//

import SwiftUI
import Lottie

struct TrendsBottomSheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                
                LottieView(animation: .named("Batman")).looping()
                    .frame(width: 300, height: 300)
                
                Text("Activity Trends")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                ScrollView {
                    Text("Closing your rings every day is a great way to stay active. Trend arrows help you stay motivated by showing even more details. If you're moving the same amount or more over the last 90 days compared to the last 365, your Move arrow will be up. Closing your rings and keeping track of your arrows helps you be active and stay active! Closing your rings every day is a great way to stay active. Trend arrows help you stay motivated by showing even more details. If you're moving the same amount or more over the last 90 days compared to the last 365, your Move arrow will be up. Closing your rings and keeping track of your arrows helps you be active and stay active! Closing your rings every day is a great way to stay active. Trend arrows help you stay motivated by showing even more details. If you're moving the same amount or more over the last 90 days compared to the last 365, your Move arrow will be up. Closing your rings and keeping track of your arrows helps you be active and stay active! Closing your rings every day is a great way to stay active. Trend arrows help you stay motivated by showing even more details. If you're moving the same amount or more over the last 90 days compared to the last 365, your Move arrow will be up. Closing your rings and keeping track of your arrows helps you be active and stay active! Closing your rings every day is a great way to stay active. Trend arrows help you stay motivated by showing even more details. If you're moving the same amount or more over the last 90 days compared to the last 365, your Move arrow will be up. Closing your rings and keeping track of your arrows helps you be active and stay active!")
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
            }
            .padding(.horizontal, 30)
        }
        .preferredColorScheme(.dark)
        Button(action: {
            dismiss()
        }) {
            Text("OK")
                .font(.headline)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray.opacity(0.35))
                .foregroundColor(.white)
                .cornerRadius(14)
        } .padding(.horizontal, 30)
            .padding(.bottom, 20)
    }
}

#Preview {
    TrendsBottomSheetView()
}

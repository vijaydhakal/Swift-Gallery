//
//  TrendsView.swift
//  Fitness
//
//  Created by Vijay Dhakal on 12/11/25.
//

import SwiftUI
import Lottie

struct TrendsView: View {
    
    @Binding var showTrendSheetSheet: Bool
    
    let accentGreen = Color(red: 0.7, green: 1.0, blue: 0.1)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Trends")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                Image(systemName: "chevron.right.circle")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            VStack {
                Image(systemName: "figure.walk")
                    .font(.system(size: 60))
                    .foregroundColor(accentGreen)
                
                Rectangle() // This is the line under the icon
                    .frame(height: 2)
                    .foregroundColor(accentGreen)
                    .padding(.horizontal, 60)
            }
            .padding(.top, 20)
            
            Text("Closing your rings every day is a great way to stay active. Trend arrows help you stay motivated by showing even more details.")
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
            
            
            Button(action: {
                
                self.showTrendSheetSheet = true
            }) {
                Text("Get Started")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .tint(.blue)
            }
            
        }
        .padding()
        .background(.thinMaterial)
        .cornerRadius(20)
        .contextMenu {
            Button(role: .destructive) {
                print("Delete")
            } label: {
                Label("Delete", systemImage: "trash")
            }
            
            Button {
                // Add share action here
                print("Share")
            } label: {
                Label("Share", systemImage: "square.and.arrow.up")
            }
        }
    }
}

#Preview{
    TrendsView(showTrendSheetSheet: .constant(false))
}

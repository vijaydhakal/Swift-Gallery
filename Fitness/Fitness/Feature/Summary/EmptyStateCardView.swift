//
//  EmptyStateCardView.swift
//  Fitness
//
//  Created by Vijay Dhakal on 12/11/25.
//
import SwiftUI

struct EmptyStateCardView: View {
    let title: String
    let iconName: String
    let iconColor: Color
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image(systemName: iconName)
                .font(.system(size: 40))
                .foregroundColor(iconColor.opacity(0.3))
                .frame(maxWidth: .infinity, alignment: .center)
            
            HStack(alignment: .top) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .frame(height: 120)
        .background(.thinMaterial)
        .cornerRadius(20)
        .contextMenu {
            Button {
                print("Edit \(title)")
            } label: {
                Label("Edit", systemImage: "pencil")
            }
            
            Button(role: .destructive) {
                print("Hide \(title)")
            } label: {
                Label("Hide", systemImage: "minus.circle")
            }
        }
    }
}

#Preview{
    EmptyStateCardView(
        title: "test", iconName: "person", iconColor: .primary
    )
}

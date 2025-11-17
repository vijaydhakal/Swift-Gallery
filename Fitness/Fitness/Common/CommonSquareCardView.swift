//
//  CommonSquareCardView.swift
//  Fitness
//
//  Created by Vijay Dhakal on 11/11/25.
//

import SwiftUI

struct CommonSquareCardView<Content: View>: View {
    let title: String
    let color: Color
    let contentView: Content
    
    init(title: String, color: Color, @ViewBuilder contentView: () -> Content) {
        self.title = title
        self.color = color
        self.contentView = contentView()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                Image(systemName: "chevron.right.circle")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            contentView
            
        }
        .padding()
        .background(.thinMaterial)
        .cornerRadius(20)
        .contextMenu {
            Button(role: .destructive) {
                print("Delete \(title)")
            } label: {
                Label("Delete", systemImage: "trash")
            }
            
            Button {
                print("Share \(title)")
            } label: {
                Label("Share", systemImage: "square.and.arrow.up")
            }
        }
    }
}

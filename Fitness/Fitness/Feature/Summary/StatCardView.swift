//
//  StatCardView.swift
//  Fitness
//
//  Created by Vijay Dhakal on 11/11/25.
//

import SwiftUI

struct StatCardView: View {
    let title: String
    let value: String
    let color: Color
    let graphType: GraphType
    
    enum GraphType { case bar, none }
    
    var body: some View {
        CommonSquareCardView(
            title: title, color: .secondary, contentView: {
                if graphType == .bar {
                    _SmallBarGraphView(graphColor: color)
                        .frame(height: 80)
                    
                } else {
                    EmptyView()
                }
            }
        )
    }
}

struct _SmallBarGraphView: View {
    let graphColor: Color
    let barHeights: [CGFloat] = [0.2, 0.1, 0.4, 0.3, 0.2, 0.1, 0.2, 0.6, 0.3, 0.5, 0.2, 0.1]
    let labels = ["12 AM", "6 AM", "12 PM", "6 PM"]
    
    var body: some View {
        VStack(spacing: 4) {
            
            HStack(alignment: .bottom, spacing: 2) {
                ForEach(barHeights.indices, id: \.self) { index in
                    
                    RoundedRectangle(cornerRadius: 1.5)
                        .fill(graphColor.opacity(0.3))
                        .frame(height: 70)
                        .overlay(alignment: .bottom) {
                            if barHeights[index] > 0.15 {
                                RoundedRectangle(cornerRadius: 1.5)
                                    .fill(graphColor)
                                    .frame(height: barHeights[index] * 70)
                            }
                        }
                }
            }
            .frame(height: 70)
            
            HStack {
                ForEach(labels.indices, id: \.self) { index in
                    Text(labels[index])
                        .font(.system(size: 8))
                        .foregroundColor(.secondary)
                    if index < labels.count - 1 {
                        Spacer()
                    }
                }
            }
        }
    }
    
    
}


#Preview {
    StatCardView( title: "Step Count",
                  value: "2.537",
                  color: .purple,
                  graphType: .bar)
}

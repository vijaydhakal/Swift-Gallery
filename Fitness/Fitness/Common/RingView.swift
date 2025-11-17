//
//  RingView.swift
//  Fitness
//
//  Created by Vijay Dhakal on 11/11/25.

import SwiftUI

struct RingView: View {
    let progress: Double
    let color: Color
    let lineWidth: CGFloat
    let size: CGFloat

    @State private var animatedProgress: Double = 0.0

    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(0.3), lineWidth: lineWidth)

            Circle()
                .trim(from: 0, to: min(animatedProgress, 1.0))
                .stroke(
                    color,
                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
            if animatedProgress > 0.01 && animatedProgress < 1.0 {
                Image(systemName: "arrow.forward")
                    .font(.system(size: lineWidth * 0.35, weight: .bold))
                    .foregroundColor(Color(UIColor.systemBackground))
                    .frame(width: lineWidth, height: lineWidth)
                    .offset(y: -size / 2)
                    .rotationEffect(.degrees(min(animatedProgress, 1.0) * 360))
            }
        }
        .frame(width: size, height: size)
        .onAppear {
            withAnimation(.easeInOut(duration: 1.0)) {
                self.animatedProgress = self.progress
            }
        }
    }
}


#Preview {
    RingView(
        progress: 51 / 120.0,
        color: .red,
        lineWidth: 20,
        size: 140
    )
}

//
//  FloatingActionButtonView.swift
//  SwiftGallery
//
//  Created by Vijay Dhakal on 09/12/25.
//

import SwiftUI

struct FloatingActionButtonView: View {
    let iconColor = Color(red: 0.3, green: 0.15, blue: 0.35)
    let innerCircleColor = Color(red: 1.0, green: 0.6, blue: 0.25)
    let outerRingColor = Color(red: 0.9, green: 0.7, blue: 0.5).opacity(0.5)
    private let buttonSize: CGFloat = 60

    var body: some View {
        Circle()
            .fill(Color.orange.opacity(0.2))
            .frame(width: buttonSize + 20, height: buttonSize + 20)
            .blur(radius: 5)
        Button(action: {
            print("Button tapped!")
        }) {
           
            ZStack {
                Circle()
                    .fill(Color.orange)
                    .frame(width: buttonSize, height: buttonSize)
                    .shadow(color: .orange.opacity(0.3), radius: 5, x: 0, y: 5)
                
                Image(systemName: "plus")
                    .font(.title2.bold())
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    ZStack {
        Color(red: 0.92, green: 0.92, blue: 0.9)
            .ignoresSafeArea()
        
        FloatingActionButtonView()
    }
}

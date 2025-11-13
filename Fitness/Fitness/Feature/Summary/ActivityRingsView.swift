//
//  ActivityRing.swift
//  Fitness
//
//  Created by Vijay Dhakal on 11/11/25.
//
import SwiftUI

struct ActivityRingsView: View {
    var body: some View {
        HStack(spacing: 20) {
            ZStack {
                RingView(
                    progress: 51 / 120.0,
                    color: .red,
                    lineWidth: 20,
                    size: 140
                )
            }
            .frame(width: 140, height: 140)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Move")
                    .font(.body)
                    .foregroundColor(.red)
                
                HStack(alignment: .firstTextBaseline, spacing: 2) {
                    Text("51")
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundColor(.primary)
                    Text("/")
                        .font(.body.weight(.medium))
                        .foregroundColor(.red)
                        .padding(.top, 8)
                    Text("120 KCAL")
                        .font(.body.weight(.medium))
                        .foregroundColor(.red)
                        .padding(.top, 8)
                }
            }
            
            Spacer()
        }
        .padding()
        .background(.thinMaterial)
        .cornerRadius(20)
        .contextMenu {
            Button {
                print("Edit Activity Rings")
            } label: {
                Label("Edit", systemImage: "pencil")
            }
            
            Button(role: .destructive) {
                print("Hide Activity Rings")
            } label: {
                Label("Hide", systemImage: "minus.circle")
            }
        }
    }
}

#Preview{
    ActivityRingsView()
}

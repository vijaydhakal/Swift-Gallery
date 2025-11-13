//
//  SessionsView.swift
//  Fitness
//
//  Created by Vijay Dhakal on 12/11/25.
//
import SwiftUI

struct SessionsView: View {
    let iconName: String
    let iconColor: Color
    let title: String
    let value: String?
    let subtitle: String?
    
    var body: some View {
        
        CommonSquareCardView(
            title: title, color: .secondary, contentView: {Image(systemName: iconName).font(.system(size: 60))
            }
        )
    }
}

#Preview{
    SessionsView(iconName: "circle", iconColor: .secondary, title: "testing", value: "value", subtitle: "sub title")
}

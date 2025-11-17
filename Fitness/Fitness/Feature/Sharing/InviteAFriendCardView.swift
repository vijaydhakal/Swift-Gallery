//
//  InviteAFriendCard.swift
//  Fitness
//
//  Created by Vijay Dhakal on 14/11/25.
//

import SwiftUI

struct InviteAFriendCard: View {
    var body: some View {
        VStack(spacing: 24) {
            
            VStack(spacing: 16) {
                Image(systemName: "person.3.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(.secondary)
                    .padding(.top, 12)
                
                Text("Share Activity")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Invite friends to share workouts, get inspired and cheer each other on.")
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                
                Button(action: {
                    // TODO: Add your action for inviting a friend
                    print("Invite a Friend button tapped")
                }) {
                    Text("Invite a Friend")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemGray3))
                        .foregroundStyle(.white)
                        .clipShape(Capsule())
                }
                .padding([.horizontal, .bottom])
            }
            .frame(maxWidth: .infinity)
            .background(Color(.secondarySystemGroupedBackground))
            .cornerRadius(20)
            .padding(.horizontal)
        }
    }
}
#Preview {
    InviteAFriendCard()
}

//
//  SharingView.swift
//  Fitness
//
//  Created by Vijay Dhakal on 14/11/25.
//
import SwiftUI

struct SharingView: View {
    
    @State private var isShowingPrivacySheet = false
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                
                InviteAFriendCard()
                
                Button(action: {
                   
                    isShowingPrivacySheet = true
                }) {
                    Text("See how your data is managed...")
                        .font(.callout)
                        .foregroundStyle(Color.green)
                }
                
                .padding(.top, 20)
            }
            .background(Color(.systemBackground))
            .navigationTitle("Sharing")
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Add friend button tapped")
                    }) {
                        Image(systemName: "person.badge.plus")
                            .font(.body.weight(.semibold))
                    }
                }
            }
            .sheet(isPresented: $isShowingPrivacySheet) {
                SharingPrivacyButtomSheet()
                        }
        }
    }
}

#Preview {
    SharingView()
}

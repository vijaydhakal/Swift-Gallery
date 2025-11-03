//
//  ForgotPasswordView.swift
//  SwiftGallery
//
//  Created by Vijay Dhakal on 03/11/25.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @State private var email = ""
    
    private let accentColor = Color(red: 248/255, green: 156/255, blue: 82/255)
    
    var body: some View {
        ZStack {
            
            Color(uiColor: .systemBackground)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    Text("FORGOT YOUR PASSWORD?")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top, 60)
                    Image("forgot_password")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .padding(.vertical, 20)
                    
                    VStack(spacing: 25) {
                        
                        Text("Enter your registered email below to receive password reset instruction")
                            .font(.subheadline)
                            .foregroundColor(Color(uiColor: .secondaryLabel))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                        
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .padding()
                            .background(Color(uiColor: .secondarySystemBackground))
                            .cornerRadius(12)
                            .padding(.horizontal)
                        
                        
                        Button(action: { print("Send Reset Link Tapped") }) {
                            Text("Send Reset Link")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(accentColor)
                                .cornerRadius(12)
                        }
                        .padding(.horizontal)
                        
                    }
                    .padding(.vertical, 30)
                    .background(Color(uiColor: .systemBackground))
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                    .padding(.horizontal)
                    
                    HStack(spacing: 4) {
                        Text("Remember password?")
                            .font(.footnote)
                        Button(action: { print("Back to Login") }) {
                            Text("Login")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(accentColor)
                        }
                    }
                    .padding(.top, 30)
                    .padding(.bottom, 20)
                    
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ForgotPasswordView()
}

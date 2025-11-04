//
//  HTACreateYourAccount.swift
//  SwiftGallery
//
//  Created by Vijay Dhakal on 02/11/25.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemBackground)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    Image("login_page")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .padding(.top, 24)
                        .padding(.bottom, 20)
                    
                    VStack(spacing: 16) {
                        Button(action: { print("Google login") }) {
                            HStack {
                                Image("google_icon")
                                    .resizable().scaledToFit().frame(width: 24, height: 24)
                                Text("Continue with Google")
                                    .font(.headline)
                                    .foregroundColor(Color(uiColor: .label).opacity(0.8))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(uiColor: .tertiarySystemBackground))
                            .cornerRadius(12)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(uiColor: .separator).opacity(0.5), lineWidth: 1))
                        }
                        
                        Button(action: { print("Facebook login") }) {
                            HStack {
                                Image("facebook_icon")
                                    .resizable().scaledToFit().frame(width: 24, height: 24)
                                Text("Continue with Facebook")
                                    .font(.headline)
                                    .foregroundColor(Color(uiColor: .label).opacity(0.8))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(uiColor: .tertiarySystemBackground))
                            .cornerRadius(12)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(uiColor: .separator).opacity(0.5), lineWidth: 1))
                        }
                    }
                    
                    Text("Log in with email")
                        .font(.caption)
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                        .padding(.vertical, 10)
                    
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(Color(red: 138/255, green: 109/255, blue: 90/255))
                            .frame(width: 20)
                        
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                    }
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(12)
                    
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(Color(red: 138/255, green: 109/255, blue: 90/255))
                            .frame(width: 20)
                        
                        if isPasswordVisible {
                            TextField("Password", text: $password)
                        } else {
                            SecureField("Password", text: $password)
                        }
                        
                        Spacer()
                        
                        Button(action: { isPasswordVisible.toggle() }) {
                            Text(isPasswordVisible ? "Hide" : "Show")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 248/255, green: 156/255, blue: 82/255))
                        }
                    }
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(12)
                    
                    HStack {
                        Spacer()
                        Button(action: { print("Forgot Password tapped") }) {
                            Text("Forgot Password?")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 248/255, green: 156/255, blue: 82/255))
                        }
                    }
                    .padding(.bottom, 10)
                    Button(action: { print("Login tapped") }) {
                        Text("Login")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 248/255, green: 156/255, blue: 82/255))
                            .cornerRadius(12)
                    }
                    HStack(spacing: 4) {
                        Text("Don't have an account?")
                            .font(.footnote)
                        Text("Sign up")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 248/255, green: 156/255, blue: 82/255))
                    }
                    .padding(.top, 20)
                    
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    LoginView()
}

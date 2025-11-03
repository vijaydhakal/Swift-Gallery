//
//  HTASignUp.swift
//  SwiftGallery
//
//  Created by Vijay Dhakal on 02/11/25.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    @State private var keepSignedIn = false
    @State private var emailForPricing = false
    
    var body: some View {
        ZStack {
            
            Color(uiColor: .systemBackground)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    Image("HTA_create_account")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .padding(.top, 24)

                    Text("CREATE YOUR ACCOUNT")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom, 20)
                    
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(Color(red: 138/255, green: 109/255, blue: 90/255))
                            .frame(width: 20)
                        
                        TextField("Full Name", text: $name)
                            .autocapitalization(.words)
                    }
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(12)
                    
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

                    Button(action: { keepSignedIn.toggle() }) {
                        HStack {
                            Image(systemName: keepSignedIn ? "checkmark.square.fill" : "square")
                                .font(.title3)
                                .foregroundColor(keepSignedIn ? Color(red: 248/255, green: 156/255, blue: 82/255) : Color(uiColor: .secondaryLabel))
                            
                            // Adaptive text
                            Text("Keep me signed in")
                                .font(.footnote)
                                .foregroundColor(Color(uiColor: .label).opacity(0.8))
                            
                            Spacer()
                        }
                    }
                    
                    Button(action: { emailForPricing.toggle() }) {
                        HStack {
                            Image(systemName: emailForPricing ? "checkmark.square.fill" : "square")
                                .font(.title3)
                                .foregroundColor(emailForPricing ? Color(red: 248/255, green: 156/255, blue: 82/255) : Color(uiColor: .secondaryLabel))
                            
                            // Adaptive text
                            Text("Email me about special pricing and more")
                                .font(.footnote)
                                .foregroundColor(Color(uiColor: .label).opacity(0.8))
                            
                            Spacer()
                        }
                    }

                    Button(action: { print("Create Account") }) {
                        Text("Create Account")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 248/255, green: 156/255, blue: 82/255))
                            .cornerRadius(12)
                    }
                    
                    Text("Or sign in with")
                        .font(.caption)
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                        .padding(.vertical, 10)
                    
                    HStack(spacing: 16) {
                        Button(action: { print("Google signup") }) {
                            HStack {
                                Image("google_icon")
                                    .resizable().scaledToFit().frame(width: 24, height: 24)
                                Text("Google")
                                    .font(.headline)
                                    .foregroundColor(Color(uiColor: .label).opacity(0.8))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(uiColor: .tertiarySystemBackground))
                            .cornerRadius(12)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(uiColor: .separator).opacity(0.5), lineWidth: 1))
                        }
                        
                        Button(action: { print("Facebook signup") }) {
                            HStack {
                                Image("facebook_icon")
                                    .resizable().scaledToFit().frame(width: 24, height: 24)
                                Text("Facebook")
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
                    
                    HStack(spacing: 4) {
                        Text("Already have an account?")
                            .font(.footnote)
                        Text("Sign In")
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
    SignUpView()
}

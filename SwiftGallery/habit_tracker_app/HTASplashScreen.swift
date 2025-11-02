//
//  SplashScreen.swift
//  SwiftGallery
//
//  Created by Vijay Dhakal on 02/11/25.
//

import SwiftUI

struct HTASplashScreen: View {
    
   var body: some View {
        GeometryReader{ geo in
            ZStack {
                Image("HTA_Splash_Screen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Welcome to Celestial Habit")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.black.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                        .textCase(.uppercase)
                    Spacer()
                }
                .padding(.top, geo.size.height * 0.08)
            }
        }
    }
}

#Preview {
    HTASplashScreen()
}

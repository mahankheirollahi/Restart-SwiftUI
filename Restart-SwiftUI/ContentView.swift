//
//  ContentView.swift
//  Restart-SwiftUI
//
//  Created by Mahan Kheirollahi on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnBoardingActive: Bool = true
    var body: some View {
        VStack {
            if isOnBoardingActive{
                OnboardingView()
            }
            else{
                HomeView()
            }
        }
        
    }
}

#Preview {
    ContentView()
}

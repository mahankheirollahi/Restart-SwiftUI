//
//  OnboardingView.swift
//  Restart-SwiftUI
//
//  Created by Mahan Kheirollahi on 7/3/24.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTY
    
    @AppStorage("onboarding") var isOnboardingActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    
    @State private var buttonOffset:CGFloat = 0
    
    @State private var isAnimating: Bool = false
    
    let hapticFeedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        ZStack {
            
            Color("ColorBlue")
                .ignoresSafeArea(.all,edges: .all)
            
            
            VStack(spacing:20) {
                //MARK: - HEADER
                Spacer()
                VStack(){
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                    
                    Text("""
                        It's not how much we give but
                        how much love we put into giving.
                        """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,10)
                }
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1),value: isAnimating)
                
                //MARK: - CENTER
                ZStack() {
                    ZStack{
                        CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    }
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                    
                }
                
                Spacer()
                
                //MARK: - FOOTER
                ZStack{
                    // BACKGROUND
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    
                    // CALL-TO-ACTION
                    
                    Text("Get Started")
                        .font(.system( .title3,design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .offset(x:20)
                    
                    // CAPSULE
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }
                    
                    // CIRCLE (DRAGGABLE)
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24,weight: .bold))
                        }
                        .foregroundStyle(.white)
                        .frame(width: 80,height: 80,alignment: .center)
                        .offset(x:buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                    
                                }
                                          ).onEnded({_ in
                                              withAnimation(Animation.easeInOut(duration: 0.4)){
                                                  if buttonOffset > buttonWidth/2 {
                                                      hapticFeedback.notificationOccurred(.success)
                                                      playSound(sound: "chimeup", type: "mp3")
                                                      buttonOffset = buttonWidth - 80
                                                      isOnboardingActive = false
                                                      
                                                  }
                                                  else{
                                                      hapticFeedback.notificationOccurred(.warning)
                                                      buttonOffset = 0
                                                  }
                                              }
                                              
                                          })
                        )
                        
                        Spacer()
                    }
                    
                    
                }//: FOOTER
                .frame(width: buttonWidth,height: 80,alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1),value: isAnimating )
                
                
                
            }//: VSTACK
        }//: ZSTACK
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

#Preview {
    OnboardingView()
}

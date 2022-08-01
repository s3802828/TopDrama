//
//  GreetingView.swift
//  TopDrama
//
//  Created by Giang Le on 31/07/2022.
//

import SwiftUI

struct GreetingView: View {
    @Binding var active: Bool
    @State var scale = 0.5
    @State var fill = 0.0
        var body: some View {
            ZStack{
                ColorConstants.grey.ignoresSafeArea(.all, edges: .all)
                
                VStack(spacing: 20){
                    Spacer()
                    VStack(spacing: 0) {
                        Text("Welcome")
                          .font(.system(size: 60))
                          .fontWeight(.heavy)
                          .foregroundColor(.black)
                        
                    }
                    Spacer()

                        VStack{
                            Image("app-icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200)
                                .overlay(Circle()
                                    .trim(from: 0.0, to: self.fill)
                                    .stroke(lineWidth: 5).frame(width: 270, height: 270)
                                    .rotationEffect(.init(degrees: -90))
                                    .shadow(radius: 8.0)
                                    .onAppear{
                                        let animation = Animation.default.delay(0.5)
                                        let repeated = animation.repeatCount(1)
                                        withAnimation(repeated){
                                            fill = 1.0
                                        }
                                })
                            Text("TopDrama")
                              .font(.system(size: 40))
                              .fontWeight(.heavy)
                              .foregroundColor(.black)
                              .padding(.top, 30)
                        }.scaleEffect(scale)
                            .onAppear{
                            let baseAnimation = Animation.easeInOut(duration: 1)
                            let repeated = baseAnimation.repeatCount(1)
                            withAnimation(repeated){
                                scale = 1.0
                            }
                        }

                    
                    Spacer()


                    Button(action: {
                        active = false
                    }, label: {
                        Capsule()
                            .fill(ColorConstants.purple)
                          .padding(8)
                          .frame(height:80)
                          .overlay(Text("Go Explore")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.black))
                    })
                    Spacer()
                    Text("@RMIT University Vietnam 2022")
                }
            }
        }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView(active: .constant(true))
    }
}

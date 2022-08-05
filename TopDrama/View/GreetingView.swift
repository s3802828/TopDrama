/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Le Quynh Giang
  ID: s3802828
  Created  date: 31/07/2022
  Last modified: 06/08/2022
  Acknowledgement: T.Huynh."SSETContactList/ContactList/Views/Welcome/GreetingView.swift".GitHub.https://github.com/TomHuynhSG/SSETContactList/blob/main/ContactList/Views/Welcome/GreetingView.swift. (accessed Jul. 31, 2022),
    iOS Academy, SwiftUI: Circle Fill Animation (2021, Xcode 12, SwiftUI 2.0) - iOS Development (May. 2, 2021). Accessed Jul. 31, 2022. [Online Video]. Available: https://www.youtube.com/watch?v=6tDTMVxn5us
*/

import SwiftUI

struct GreetingView: View {
    @Binding var active: Bool
    @State var scale = 0.5 //Used to control the scale of view when doing the animation
    @State var fill = 0.0 //Used to control the fillness of circle when doing the animation
        var body: some View {
            ZStack{
                ColorConstants.grey.ignoresSafeArea(.all, edges: .all)
                
                VStack(spacing: 20){
                    Spacer()
                    VStack(spacing: 0) {
                        //MARK: WELCOME TEXT
                        Text("Welcome")
                          .font(.system(size: 60))
                          .fontWeight(.heavy)
                          .foregroundColor(.black)
                        
                    }
                    Spacer()

                        VStack{
                            //MARK: APP ICON & NAME
                            Image("app-icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200)
                            //Overlay by the circle
                                .overlay(Circle()
                                    .trim(from: 0.0, to: self.fill)
                                    .stroke(lineWidth: 5).frame(width: 270, height: 270)
                                    .rotationEffect(.init(degrees: -90))
                                    .shadow(radius: 8.0)
                                    .onAppear{
                                        //Add animation for the circle
                                        let animation = Animation.default.delay(0.5)
                                        //The animation only play once
                                        let repeated = animation.repeatCount(1)
                                        withAnimation(repeated){
                                            //Make the circle fill from 0 to 1 (empty to full)
                                            fill = 1.0
                                        }
                                })
                            Text("TopDrama")
                              .font(.system(size: 40))
                              .fontWeight(.heavy)
                              .foregroundColor(.black)
                              .padding(.top, 30)
                            //Add animation for the app icon and name
                        }.scaleEffect(scale)
                            .onAppear{
                            let baseAnimation = Animation.easeInOut(duration: 1)
                            let repeated = baseAnimation.repeatCount(1) //Only play the animation once
                            withAnimation(repeated){
                                //Zoom in the app icon and app name by change the scale from 0.5 to 1.0
                                scale = 1.0
                            }
                        }

                    
                    Spacer()

                    //MARK: GO EXPLORE BUTTON
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
                    //MARK: FOOTER MARK
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

/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Le Quynh Giang
  ID: s3802828
  Created  date: 23/07/2022
  Last modified: 06/08/2022
  Acknowledgement: T.Huynh."SSETContactList/ContactList/Views/ContactCard.swift".GitHub.https://github.com/TomHuynhSG/SSETContactList/blob/main/ContactList/Views/ContactCard.swift. (accessed Jul. 23, 2022)
    P.Hudson."How to play movies with VideoPlayer".Hacking With Swift.https://www.hackingwithswift.com/quick-start/swiftui/how-to-play-movies-with-videoplayer (accessed Jul. 23, 2022)
*/

import SwiftUI
import AVKit

struct MovieDetailPage: View {
    var movie: Movie
    @State var player = AVPlayer()
    var body: some View {
        ZStack {
        ColorConstants.lightGrey
            .edgesIgnoringSafeArea(.bottom)
        ScrollView {
                
                VStack {
                    //MARK: TRAILER
                    VideoPlayer(player: player)
                        .frame(height: 250)
                        .onAppear(){
                            //Play the video right after the view is shown
                            player = AVPlayer(url:  Bundle.main.url(forResource: movie.trailerName, withExtension: "mp4")!)
                            player.play()
                        }
                        .onDisappear(){
                            //Pause the player when the view is disappeared
                            player.pause()
                        }
                    //MARK: MOVIE NAME & IMAGE
                    HStack(alignment: .center) {
                        RectangleImage(image: movie.avatar)
                            .image.resizable()
                            .frame(width: 110, height: 160)
                        Text(movie.name)
                            .font(.system(size: 36))
                            .bold()
                            .padding(.all)
                        .foregroundColor(.black)
                    }.padding(.top, 20)
                    //MARK: MOVIE DETAILS
                    InfoView(movie: movie).padding()
                }
            }
        }
        .navigationTitle(movie.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct MovieDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailPage(movie: categories[0].movieList[0])
    }
}

//
//  MovieDetailPage.swift
//  TopDrama
//
//  Created by Giang Le on 23/07/2022.
//

import SwiftUI
import AVKit

struct MovieDetailPage: View {
    var movie: Movie
    @State var player = AVPlayer()
    var body: some View {
        ZStack {
        ColorConstants.white
            .edgesIgnoringSafeArea(.bottom)
        ScrollView {
            
                VStack {
                    VideoPlayer(player: player)
                        .frame(height: 250)
                        .onAppear(){
                            player = AVPlayer(url:  Bundle.main.url(forResource: movie.trailerName, withExtension: "mp4")!)
                            player.play()
                        }
                        .onDisappear(){
                            player.pause()
                        }
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

//
//  InfoView.swift
//  TopDrama
//
//  Created by Giang Le on 23/07/2022.
//

import SwiftUI
import Foundation

struct InfoView: View {
    let movie: Movie
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Rating: ")
                    .font(.system(size: 15))
                    .bold()
                let roundedRating = Int(floor(movie.rating))
                ForEach((1...roundedRating), id: \.self) {_ in
                    Image(systemName: "star.fill")
                }
                if movie.rating - Double(roundedRating) != 0.0 {
                    Image(systemName: "star.leadinghalf.filled")
                }
                Text(String(movie.rating))
                    .font(.system(size: 12.5))
            }
            HStack {
                Text("Director: ")
                    .font(.system(size: 15))
                    .bold()
                Text(movie.director)
                    .font(.system(size: 12.5))
            }.padding(.top, 10)
            HStack {
                Text("Starring: ")
                    .font(.system(size: 15))
                    .bold()
                Text(movie.casts.joined(separator: ", "))
                    .font(.system(size: 12.5))
            }.padding(.top, 10)
            
            HStack {
                Text("Total Episodes: ")
                    .font(.system(size: 15))
                    .bold()
                Text(String(movie.totalEpisodes))
                    .font(.system(size: 12.5))
            }.padding(.top, 10)
            
            
            HStack {
                Text("Year of Release: ")
                    .font(.system(size: 15))
                    .bold()
                Text(String(movie.yearOfRelease))
                    .font(.system(size: 12.5))
            }.padding(.top, 10)
            
            VStack(alignment: .leading) {
                Text("Description: ")
                    .font(.system(size: 15))
                    .bold()
                Text(movie.description)
                    .font(.system(size: 12.5)).padding(.top, 2)
            }.padding(.top, 10)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(movie: categories[0].movieList[0])
    }
}

//
//  MovieCard.swift
//  TopDrama
//
//  Created by Giang Le on 23/07/2022.
//

import SwiftUI

struct MovieCardHorizontal: View {
    var movie : Movie
    var body: some View {
        HStack {
            Image(movie.avatarName)
                .resizable()
                .frame(width: 100, height: 120)
            Text(movie.name)
                .foregroundColor(.black)
                .font(.system(size: 30).bold())
                .frame(width: 200)
                .padding(.trailing, 5)
        }
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.black))
    }
}

struct MovieCardVertical: View {
    var movie : Movie
    var body: some View {
        VStack {
            
            Image(movie.avatarName)
                .resizable()
                .clipShape(Rectangle())
                .frame(width: 300, height: 400)
            Text(movie.name)
                .foregroundColor(.black)
                .font(.system(size: 20).bold())
                .multilineTextAlignment(.center)
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(Color.orange)
                Text("\(String(movie.rating)) / 10")
                    .foregroundColor(.black)
                    .font(.system(size: 20).bold())
            }
        }
    }
}


struct MovieCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieCardHorizontal(movie: categories[0].movieList[0])
            MovieCardVertical(movie: categories[0].movieList[0])
        }
    }
}

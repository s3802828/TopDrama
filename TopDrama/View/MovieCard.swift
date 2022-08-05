/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Le Quynh Giang
  ID: s3802828
  Created  date: 23/07/2022
  Last modified: 06/08/2022
  Acknowledgement: T.Huynh."SSETContactList/ContactList/Views/ContactRow.swift".GitHub.https://github.com/TomHuynhSG/SSETContactList/blob/main/ContactList/Views/ContactRow.swift. (accessed Jul. 23, 2022)
*/

import SwiftUI
//MARK: HORIZONTAL STYLE
struct MovieCardHorizontal: View {
    var movie : Movie
    var body: some View {
        HStack {
            //Display the movie image
            Image(movie.avatarName)
                .resizable()
                .frame(width: 100, height: 120)
            //Display the movie name
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
//MARK: VERTICLE STYLE
struct MovieCardVertical: View {
    var movie : Movie
    var body: some View {
        VStack {
            //Display the movie image
            Image(movie.avatarName)
                .resizable()
                .clipShape(Rectangle())
                .frame(width: 300, height: 400)
            //Display the movie name
            Text(movie.name)
                .foregroundColor(.black)
                .font(.system(size: 20).bold())
                .multilineTextAlignment(.center)
            //Display the movie rating
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

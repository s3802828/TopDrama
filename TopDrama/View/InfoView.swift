/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Le Quynh Giang
  ID: s3802828
  Created  date: 23/07/2022
  Last modified: 06/08/2022
  Acknowledgement: T.Huynh."SSETContactList/ContactList/Views/InfoView.swift".GitHub.https://github.com/TomHuynhSG/SSETContactList/blob/main/ContactList/Views/InfoView.swift. (accessed Jul. 23, 2022)
*/
import SwiftUI
import Foundation

struct InfoView: View {
    let movie: Movie
    var body: some View {
        VStack(alignment: .leading) {
            //MARK: RATING
            HStack {
                Text("Rating: ")
                    .font(.system(size: 15))
                    .bold()
                let roundedRating = Int(floor(movie.rating))
                //Label the star fill for the whole number part
                ForEach((1...roundedRating), id: \.self) {_ in
                    Image(systemName: "star.fill")
                }
                //Label the half star fill for the decimal part (if any)
                if movie.rating - Double(roundedRating) != 0.0 {
                    Image(systemName: "star.leadinghalf.filled")
                }
                Text(String(movie.rating))
                    .font(.system(size: 12.5))
            }
            //MARK: DIRECTOR
            HStack {
                Text("Director: ")
                    .font(.system(size: 15))
                    .bold()
                Text(movie.director)
                    .font(.system(size: 12.5))
            }.padding(.top, 10)
            //MARK: STARRING
            HStack {
                Text("Starring: ")
                    .font(.system(size: 15))
                    .bold()
                //Join the elements in the array by the comma
                Text(movie.casts.joined(separator: ", "))
                    .font(.system(size: 12.5))
            }.padding(.top, 10)
            //MARK: TOTAL EPISODES
            HStack {
                Text("Total Episodes: ")
                    .font(.system(size: 15))
                    .bold()
                Text(String(movie.totalEpisodes))
                    .font(.system(size: 12.5))
            }.padding(.top, 10)
            
            //MARK: RELEASE YEAR
            HStack {
                Text("Year of Release: ")
                    .font(.system(size: 15))
                    .bold()
                Text(String(movie.yearOfRelease))
                    .font(.system(size: 12.5))
            }.padding(.top, 10)
            //MARK: DESCRIPTION
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

/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Le Quynh Giang
  ID: s3802828
  Created  date: 23/07/2022
  Last modified: 06/08/2022
  Acknowledgement: T.Huynh."SSETContactList/ContactList/Views/ContactList.swift".GitHub.https://github.com/TomHuynhSG/SSETContactList/blob/main/ContactList/Views/ContactList.swift. (accessed Jul. 23, 2022)
*/

import SwiftUI

struct MovieList: View {
    var category: Category
    var body: some View {
        ZStack{
            ColorConstants.lightGrey.ignoresSafeArea(.all, edges: .all)
            ScrollView{
                let sortedMovies = category.movieList.sorted{
                    $0.rating > $1.rating
                }
                //Display movie card list based on the specified category
                ForEach((0..<sortedMovies.count), id: \.self) {idx in
                    //Navigation item that would link the movie card to the movie detail page
                    NavigationLink(destination: MovieDetailPage(movie: sortedMovies[idx])) {
                        HStack{
                            Text("#\(idx+1)")
                                .foregroundColor(.black)
                                .padding(.all)
                                .font(.system(size: 30).bold())
                                MovieCardHorizontal(movie: sortedMovies[idx])
                        }
                    }
                    }
                }
            .navigationTitle("\(category.name) Dramas \(category.symbol)")
        }
            
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList(category: categories[0])
    }
}

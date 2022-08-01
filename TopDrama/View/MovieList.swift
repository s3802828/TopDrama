//
//  MovieList.swift
//  TopDrama
//
//  Created by Giang Le on 23/07/2022.
//

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
                ForEach((0..<sortedMovies.count), id: \.self) {idx in
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

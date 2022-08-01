//
//  HomeView.swift
//  TopDrama
//
//  Created by Giang Le on 31/07/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            ZStack{
                ColorConstants.lightGrey.ignoresSafeArea(.all, edges: .all)
            
            ScrollView {
            Spacer()
            Spacer()
            Text("🔥 HOT MOVIES 🔥")
                .foregroundColor(Color.white)
                .font(.system(size: 30).bold())
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(RoundedRectangle(cornerRadius: 45).fill(Color.black))
                
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack (spacing: 20){
                        
                        ForEach((0..<categories.count), id: \.self){
                            index in
                            let sortedMovies = categories[index].movieList.sorted {
                                $0.rating > $1.rating
                            }
                            NavigationLink(destination: MovieDetailPage(movie: sortedMovies[0])) {
                                MovieCardVertical(movie: sortedMovies[0])
                                    .aspectRatio(contentMode: .fill)
                            }
                            NavigationLink(destination: MovieDetailPage(movie: sortedMovies[1])) {
                                MovieCardVertical(movie: sortedMovies[1])
                                    .aspectRatio(contentMode: .fill)
                            }
                            
                        }
                    }
                    .padding(.vertical, 10)
                    .aspectRatio(contentMode: .fill)
                    
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
                
                ForEach((0..<categories.count), id: \.self){
                    index in
                    
                    VStack {
                        
                        NavigationLink(destination: MovieList(category: categories[index])) {
                            
                            Text("Top \(categories[index].name) Dramas \(categories[index].symbol)")
                                .foregroundColor(Color.black)
                                .font(.system(size: 30).bold())
                                .multilineTextAlignment(.leading)
                        }
                        
                        HStack{
                            let sortedMovies = categories[index].movieList.sorted {
                                $0.rating > $1.rating
                            }
                            ForEach((0..<3), id: \.self) {idx in
                                NavigationLink(destination: MovieDetailPage(movie: sortedMovies[idx])) {
                                    Image(sortedMovies[idx].avatarName)
                                        .resizable()
                                        .frame(width: 120, height: 200)
                                        .edgesIgnoringSafeArea(.all)
                                }
                                
                                }
                            }
                    }.padding(.vertical, 20)
                }
                    
            }
            .navigationBarHidden(true)
            .navigationBarTitle(Text("Home"))
        }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

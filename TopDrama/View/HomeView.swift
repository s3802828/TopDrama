//
/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Le Quynh Giang
  ID: s3802828
  Created  date: 31/07/2022
  Last modified: 06/08/2022
  Acknowledgement: T.Huynh."SSETContactList/ContactList/Views/InfoView.swift".GitHub.https://github.com/TomHuynhSG/SSETContactList/blob/main/ContactList/Views/InfoView.swift. (accessed Jul. 23, 2022),
    Lets Build That App, SwiftUI Movies Carousel Parallax Zoom Animation (Jan. 11, 2021). Accessed Jul. 31, 2022. [Online Video]. Available: https://www.youtube.com/watch?v=euGLqwOEpZE&t=1257s
    
*/

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            ZStack{
                //MARK: BACKGROUND COLOR
                ColorConstants.lightGrey.ignoresSafeArea(.all, edges: .all)
            ScrollView {
            Spacer()
            Spacer()
                //MARK: HOT MOVIES
            Text("🔥 HOT MOVIES 🔥")
                .foregroundColor(Color.white)
                .font(.system(size: 30).bold())
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(RoundedRectangle(cornerRadius: 45).fill(Color.black))
                
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack (spacing: 20){
                        //Choose top 2 movies of each country to display in the horizontal ScrollView
                        ForEach((0..<categories.count), id: \.self){
                            index in
                            //Sort the movie list first based on the rating
                            let sortedMovies = categories[index].movieList.sorted {
                                $0.rating > $1.rating
                            }
                            //Add 2 movie cards in the navigation item that link to movie detail page of corresponding movie
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
                
                //MARK: TOP MOVIE LOOP
                //Loop through each category (country)
                ForEach((0..<categories.count), id: \.self){
                    index in
                    //Verticle
                    VStack {
                        //The title "TOP ... DRAMAS" are also the navigation link that link to the movie list of specified category
                        NavigationLink(destination: MovieList(category: categories[index])) {
                            
                            Text("Top \(categories[index].name) Dramas \(categories[index].symbol)")
                                .foregroundColor(Color.black)
                                .font(.system(size: 30).bold())
                                .multilineTextAlignment(.leading)
                        }
                        //Top 3 movies that link to the movie detail page of corresponding one
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
            .padding(.top, 1)
        }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

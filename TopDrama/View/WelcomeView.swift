/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Le Quynh Giang
  ID: s3802828
  Created  date: 31/07/2022
  Last modified: 06/08/2022
  Acknowledgement: T.Huynh."SSETContactList/ContactList/Views/Welcome/WelcomeView.swift".GitHub.https://github.com/TomHuynhSG/SSETContactList/blob/main/ContactList/Views/Welcome/WelcomeView.swift. (accessed Jul. 31, 2022)
*/

import SwiftUI

struct WelcomeView: View {
    @State var isWelcomeActive: Bool = true
        var body: some View {
            ZStack {
                //If button isn't tapped, show the greeting view
                if isWelcomeActive {
                    GreetingView(active: $isWelcomeActive)
                } else {
                //Otherwise, show home view
                    HomeView()
                }
            }
        }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

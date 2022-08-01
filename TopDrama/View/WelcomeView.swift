//
//  WelcomeView.swift
//  TopDrama
//
//  Created by Giang Le on 31/07/2022.
//

import SwiftUI

struct WelcomeView: View {
    @State var isWelcomeActive: Bool = true
        var body: some View {
            ZStack {
                if isWelcomeActive {
                    GreetingView(active: $isWelcomeActive)
                } else {
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

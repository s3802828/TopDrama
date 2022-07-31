//
//  RectangleImage.swift
//  TopDrama
//
//  Created by Giang Le on 23/07/2022.
//

import SwiftUI

struct RectangleImage: View {
    var image: Image
    var body: some View {
        image
        .clipShape(Rectangle())
        .overlay(Rectangle().stroke(Color(.white),lineWidth: 4))
                    .shadow(radius: 7)
    }
}

struct RectangleImage_Previews: PreviewProvider {
    static var previews: some View {
        RectangleImage(image: Image("default-avatar"))
    }
}

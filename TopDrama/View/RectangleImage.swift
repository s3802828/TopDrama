/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Le Quynh Giang
  ID: s3802828
  Created  date: 23/07/2022
  Last modified: 06/08/2022
  Acknowledgement: T.Huynh."SSETContactList/ContactList/Views/CircleImage.swift".GitHub.https://github.com/TomHuynhSG/SSETContactList/blob/main/ContactList/Views/CircleImage.swift. (accessed Jul. 23, 2022)
*/

import SwiftUI

struct RectangleImage: View {
    var image: Image
    var body: some View {
        //Make image clipped in the Rectangle shape
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

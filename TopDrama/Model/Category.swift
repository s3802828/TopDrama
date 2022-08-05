/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Le Quynh Giang
  ID: s3802828
  Created  date: 26/07/2022
  Last modified: 26/07/2022
  Acknowledgement: T.Huynh."SSETContactList/ContactList/Model/Contact.swift".GitHub.https://github.com/TomHuynhSG/SSETContactList/blob/main/ContactList/Model/Contact.swift. (accessed Jul. 26, 2022)
*/

import Foundation
struct Category: Identifiable{
    var id = UUID()
    var name: String
    var movieList: [Movie]
    var symbol: String
}

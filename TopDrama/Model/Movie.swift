/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Le Quynh Giang
  ID: s3802828
  Created  date: 23/07/2022
  Last modified: 31/07/2022
  Acknowledgement: T.Huynh."SSETContactList/ContactList/Model/Contact.swift".GitHub.https://github.com/TomHuynhSG/SSETContactList/blob/main/ContactList/Model/Contact.swift. (accessed Jul. 23, 2022)
*/

import Foundation
import SwiftUI

struct Movie: Identifiable, Codable{
    var id: Int
    var name: String
    var director: String
    var casts: [String]
    var totalEpisodes: Int
    var description: String
    var avatarName: String
    var avatar: Image{
        Image(avatarName)
    }
    var trailerName: String
    var rating: Double
    var yearOfRelease: String
}

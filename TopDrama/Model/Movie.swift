//
//  Movie.swift
//  TopDrama
//
//  Created by Giang Le on 23/07/2022.
//

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

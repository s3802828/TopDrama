//
//  Category.swift
//  TopDrama
//
//  Created by Giang Le on 31/07/2022.
//

import Foundation
struct Category: Identifiable{
    var id = UUID()
    var name: String
    var movieList: [Movie]
    var symbol: String
}

/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Le Quynh Giang
  ID: s3802828
  Created  date: 31/07/2022
  Last modified: 06/08/2022
  Acknowledgement: T.Huynh."SSETContactList/ContactList/Model/ModelData.swift".GitHub.https://github.com/TomHuynhSG/SSETContactList/blob/main/ContactList/Model/ModelData.swift. (accessed Jul. 31, 2022)
*/

import Foundation
var kmovies = decodeJsonFromJsonFile(jsonFileName: "kmovies.json")

var cmovies = decodeJsonFromJsonFile(jsonFileName: "cmovies.json")

var tmovies = decodeJsonFromJsonFile(jsonFileName: "tmovies.json")

var categories: [Category] = [
    Category(name: "Korean", movieList: kmovies, symbol: "🇰🇷"),
    Category(name: "Thai", movieList: tmovies, symbol: "🇹🇭"),
    Category(name: "Chinese", movieList: cmovies, symbol: "🇨🇳")
]

// How to decode a json file into a struct
func decodeJsonFromJsonFile(jsonFileName: String) -> [Movie] {
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil){
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Movie].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [ ] as [Movie]
}

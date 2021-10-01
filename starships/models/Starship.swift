//
//  Starship.swift
//  starships
//
//  Created by Aatish Rajkarnikar on 29/9/21.
//

import Foundation


struct Starship: Codable, Identifiable, Hashable {
    let id = UUID()
    let name: String
    let model: String
    let manufacturer: String
    let costInCredits: String
    let length: String
    let maxAtmospheringSpeed: String
    let crew: String
    let passengers: String
    let cargoCapacity: String
    let consumables: String
    let hyperdriveRating: String
    let MGLT: String
    let starshipClass: String
    let pilots: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
    
}


struct StarshipResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Starship]
}

extension Starship {
    static var dummyData: Starship {
        .init(name: "Star Destroyer", model: "Imperial I-class Star Destroyer", manufacturer: "Kuat Drive Yards", costInCredits: "", length: "", maxAtmospheringSpeed: "", crew: "", passengers: "", cargoCapacity: "100000", consumables: "", hyperdriveRating: "4.7", MGLT: "", starshipClass: "", pilots: [], films: [], created: "", edited: "", url: "")
    }
}

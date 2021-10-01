//
//  FavouriteManager.swift
//  starships
//
//  Created by Aatish Rajkarnikar on 30/9/21.
//

import Foundation

class FavouriteManager: ObservableObject {
    static let shared: FavouriteManager = FavouriteManager()
    
    @Published var favourites: Set<Starship>
    
    private init() {
        favourites = []
    }
    
    func addToFavourite(starship: Starship) {
        objectWillChange.send()
        favourites.insert(starship)
    }
    
    func removeFavourite(starship: Starship) {
        objectWillChange.send()
        favourites.remove(starship)
    }
    
    func contains(startship: Starship) -> Bool {
        return favourites.contains(startship)
    }
    
    
    func save() {
        
    }
    
    func load() {
        
    }
}

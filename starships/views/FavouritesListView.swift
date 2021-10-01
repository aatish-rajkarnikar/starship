//
//  FavouritesListView.swift
//  starships
//
//  Created by Aatish Rajkarnikar on 30/9/21.
//

import SwiftUI

struct FavouritesListView: View {
    
    @ObservedObject var favouriteManager = FavouriteManager.shared
    
    var body: some View {
        NavigationView{
            List(Array(favouriteManager.favourites)) { item in
                NavigationLink(
                    destination: StarshipDetailView(starship: item)) {
                        StarshipCellView(starship: item)
                    }
            }.navigationBarTitle("Favourites")
        }
    }
}

struct FavouritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesListView()
    }
}

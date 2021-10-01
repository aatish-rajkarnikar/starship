//
//  StarshipDetailView.swift
//  starships
//
//  Created by Aatish Rajkarnikar on 29/9/21.
//

import SwiftUI

struct StarshipDetailView: View {
    
    var starship: Starship
    
    var isFavourite: Bool {
        return favouriteManager.contains(startship: starship)
    }
    
    @ObservedObject var favouriteManager = FavouriteManager.shared
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8, content: {
                    Group {
                        RowView(title: "Model", value: starship.model)
                        Divider()
                        RowView(title: "Manufacturer", value: starship.manufacturer)
                        Divider()
                        RowView(title: "Cost in Credit", value: starship.costInCredits)
                        Divider()
                        RowView(title: "Length", value: starship.length)
                        Divider()
                        RowView(title: "Max Atmosphering Speed", value: starship.maxAtmospheringSpeed)
                        Divider()
                    }
                    Group {
                        RowView(title: "Crew", value: starship.crew)
                        Divider()
                        RowView(title: "Passangers", value: starship.passengers)
                        Divider()
                        RowView(title: "Cargo Capacity", value: starship.cargoCapacity)
                        Divider()
                        RowView(title: "Consumables", value: starship.consumables)
                        Divider()
                        RowView(title: "Hyperdrive Rating", value: starship.hyperdriveRating)
                        Divider()
                    }
                    Group {
                        RowView(title: "MGLT", value: starship.MGLT)
                        Divider()
                        RowView(title: "Starship Class", value: starship.starshipClass)
                        Divider()
                        RowView(title: "Created", value: starship.created)
                    }
                    
                    FavouriteButtonView(isFav: isFavourite) {
                        if isFavourite {
                            favouriteManager.removeFavourite(starship: starship)
                        } else {
                            favouriteManager.addToFavourite(starship: starship)
                        }
                    }
                }).padding()
                
            }
        }
        .navigationBarTitle(starship.name)
    }
}

struct StarshipDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StarshipDetailView(starship: Starship.dummyData)
    }
}

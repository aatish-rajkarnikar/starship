//
//  StarshipCellView.swift
//  starships
//
//  Created by Aatish Rajkarnikar on 29/9/21.
//

import SwiftUI

struct StarshipCellView: View {
    
    let starship: Starship
    
    var isFavourite: Bool {
        return favouriteManager.contains(startship: starship)
    }
    
    @ObservedObject var favouriteManager = FavouriteManager.shared
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            Text(starship.name).font(.headline).foregroundColor(.red)
            RowView(title: "Model", value: starship.model)
            RowView(title: "Manufacturer", value: starship.manufacturer)
            RowView(title: "Cost In Credit", value: starship.costInCredits)
            
            FavouriteButtonView(isFav: isFavourite, action: {
                if isFavourite {
                    favouriteManager.removeFavourite(starship: starship)
                } else {
                    favouriteManager.addToFavourite(starship: starship)
                }
            })
        }).padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
        
    }
    
    init(starship: Starship) {
        self.starship = starship
    }
}

struct StarshipCellView_Previews: PreviewProvider {
    static var previews: some View {
        StarshipCellView(starship: Starship.dummyData).previewLayout(.sizeThatFits)
    }
}

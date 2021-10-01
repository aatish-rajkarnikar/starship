//
//  FavouriteButtonView.swift
//  starships
//
//  Created by Aatish Rajkarnikar on 30/9/21.
//

import SwiftUI

struct FavouriteButtonView: View {
    var isFav: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            print("Edit button was tapped")
            action()
        }) {
            HStack(spacing: 10) {
                Spacer()
                Image(systemName: isFav ? "heart.fill" : "heart")
                Text(isFav ? "Favourite" : "Add To Favourite")
                Spacer()
            }.padding()
            .background(isFav ? Color.red : Color.white)
            .cornerRadius(8)
            .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.red, lineWidth: 1)
            )
        }.foregroundColor(isFav ? Color.white : Color.red).buttonStyle(PlainButtonStyle())
    }
}

struct FavouriteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteButtonView(isFav: true, action: {})
    }
}

//
//  StarshipListView.swift
//  starships
//
//  Created by Aatish Rajkarnikar on 29/9/21.
//

import SwiftUI
import Combine

struct StarshipListView: View {
    
    @ObservedObject var viewModel = StarshipListViewModel()
    
    @State private var showFavourites = false
    
    var body: some View {
        NavigationView{
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else {
                List(viewModel.ships) { item in
                    NavigationLink(
                        destination: StarshipDetailView(starship: item)) {
                            StarshipCellView(starship: item)
                        }
                }
                .navigationBarTitle("Starships")
                .navigationBarItems(trailing:
                        Button(action: {
                            showFavourites.toggle()
                        }) {
                            Image(systemName: "heart.circle.fill")
                                .font(Font.system(.title)).foregroundColor(.red)
                        }
                    )
            }
        }
        .onAppear {
            viewModel.fetchStarships()
        }
        .sheet(isPresented: $showFavourites, content: {
            FavouritesListView()
        })
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Error!"), message: Text("Something went wrong."), dismissButton: .default(Text("Got it!")))
        }
        
    }
}

struct StarshipListView_Previews: PreviewProvider {
    static var previews: some View {
        StarshipListView()
    }
}

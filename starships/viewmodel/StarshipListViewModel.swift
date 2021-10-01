//
//  StarshipListViewModel.swift
//  starships
//
//  Created by Aatish Rajkarnikar on 29/9/21.
//

import Foundation
import Combine

class StarshipListViewModel : ObservableObject {
    @Published var ships = [Starship]()
    @Published var isLoading = false
    @Published var alert: (title: String, desc: String)?
    
    var service = ApiService()

    func fetchStarships() {
        service.getStarships { [weak self] response, err in
            if let ships = response?.results {
                DispatchQueue.main.async {
                    self?.ships = ships
                }
            } else {
                DispatchQueue.main.async {
                    self?.alert = ("Error!" , "something went wrong.")
                }
            }
        }
    }
}

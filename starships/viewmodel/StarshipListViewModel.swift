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
    @Published var showAlert = false
    @Published var isLoading = false
    
    var service = ApiService()

    func fetchStarships() {
        self.isLoading = true
        service.getStarships { [weak self] response, err in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let ships = response?.results {
                    self?.ships = ships
                } else {
                    self?.showAlert = true
                }
            }
        }
    }
}

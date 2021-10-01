//
//  ApiService.swift
//  starships
//
//  Created by Aatish Rajkarnikar on 29/9/21.
//

import Foundation


struct ApiService {
    private static let baseUrl = "https://swapi.dev/api"
    
    
    func getStarships(completion: @escaping ((StarshipResponse?, Error?) -> Void)) {
        let urlString = "https://swapi.dev/api/starships/"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let res = try decoder.decode(StarshipResponse.self, from: data)
                    completion(res, nil)
                } catch let err {
                    completion(nil, err)
                }
            } else {
                completion(nil, error)
            }
        }.resume()
    }
    
    
}

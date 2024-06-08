//
//  PokemonViewModel.swift
//  poke-adventru
//
//  Created by Rodrigo Consuelos on 07/06/24.
//

import Foundation

class PokemonViewModel: ObservableObject {
    @Published var pokemones = [Pokemon]()
    
    let baseUrl = "https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0"
    
    func fetchPokemon() {
        guard let url = URL(string: baseUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Error al traer los datos:", error?.localizedDescription ?? "Unknown error")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let results = json["results"] as? [[String: String]] {
                        let pokemones = results.map { dict -> Pokemon in
                            let name = dict["name"] ?? ""
                            let url = dict["url"] ?? ""
                            return Pokemon(name: name, url: url)
                        }
                        DispatchQueue.main.async {
                            self.pokemones = pokemones
                        }
                    }
                } catch let error as NSError {
                print("Error en el JSON:", error.localizedDescription)
            }
        }.resume()
    }
}

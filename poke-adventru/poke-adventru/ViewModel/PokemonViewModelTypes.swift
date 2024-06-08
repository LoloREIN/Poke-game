//
//  PokemonViewModelTypes.swift
//  poke-adventru
//
//  Created by Rodrigo Consuelos on 07/06/24.
//

import Foundation
/*
struct Pokemon:  Identifiable {
    var id = UUID()
    let name: String
    let url: String
    let types : [String]
}



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
                        let dispatchGroup = DispatchGroup()
                        var fetchedPokemones = [Pokemon]()
                        
                        for dict in results {
                            let name = dict["name"] ?? ""
                            let url = dict["url"] ?? ""
                            
                            dispatchGroup.enter()
                            self.fetchPokemonDetails(url: url) { types in
                                let pokemon = Pokemon(name: name, url: url, types: types)
                                fetchedPokemones.append(pokemon)
                                dispatchGroup.leave()
                            }
                        }
                        
                        dispatchGroup.notify(queue: .main) {
                            self.pokemones = fetchedPokemones
                        }
                    }
                } catch let error as NSError {
                print("Error en el JSON:", error.localizedDescription)
            }
        }.resume()
    }
    
    private func fetchPokemonDetails(url: String, completion: @escaping ([String]) -> Void) {
        guard let url = URL(string: url) else {
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Error al traer los datos del Pokémon:", error?.localizedDescription ?? "Unknown error")
                completion([])
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let types = json["types"] as? [[String: Any]] {
                    let typeNames = types.compactMap { typeDict -> String? in
                        guard let type = typeDict["type"] as? [String: Any],
                              let typeName = type["name"] as? String else {
                            return nil
                        }
                        return typeName
                    }
                    completion(typeNames)
                } else {
                    completion([])
                }
            } catch let error as NSError {
                print("Error en el JSON de los detalles del Pokémon:", error.localizedDescription)
                completion([])
            }
        }.resume()
    }
}
*/

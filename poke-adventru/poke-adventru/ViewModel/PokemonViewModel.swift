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
                    var fetchedPokemones = [Pokemon]()
                    let dispatchGroup = DispatchGroup()

                    for dict in results {
                        let name = dict["name"] ?? ""
                        let url = dict["url"] ?? ""
                        
                        dispatchGroup.enter()
                        self.fetchPokemonDetails(url: url) { types, sprite in
                            let pokemon = Pokemon(name: name, url: url, types: types, sprite: sprite)
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

    
    
    
    private func fetchPokemonDetails(url: String, completion: @escaping ([String], String) -> Void) {
        guard let url = URL(string: url) else {
            completion([], "") // Si la URL no es válida, se llama al closure con un array vacío y una cadena vacía
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Error al traer los datos del Pokémon:", error?.localizedDescription ?? "Unknown error")
                completion([], "") // Si hay un error al obtener los datos, se llama al closure con un array vacío y una cadena vacía
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let types = json["types"] as? [[String: Any]],
                   let sprites = json["sprites"] as? [String: Any],
                   let frontDefaultSprite = sprites["front_default"] as? String {
                    
                    let typeNames = types.compactMap { typeDict -> String? in
                        guard let type = typeDict["type"] as? [String: Any],
                              let typeName = type["name"] as? String else {
                            return nil
                        }
                        return typeName
                    }
                    
                    completion(typeNames, frontDefaultSprite) // Se llama al closure con los nombres de los tipos y el sprite
                } else {
                    completion([], "") // Si no se puede parsear el JSON, se llama al closure con un array vacío y una cadena vacía
                }
            } catch let error as NSError {
                print("Error en el JSON de los detalles del Pokémon:", error.localizedDescription)
                completion([], "") // Si hay un error al parsear el JSON, se llama al closure con un array vacío y una cadena vacía
            }
        }.resume()
    }

    
    
}

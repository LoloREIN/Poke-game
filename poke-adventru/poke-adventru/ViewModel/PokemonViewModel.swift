//
//  PokemonViewModel.swift
//  poke-adventru
//
//  Created by Rodrigo Consuelos on 07/06/24.
//

import Foundation

class PokemonViewModel: ObservableObject {
    private var pokemonListTemporal: [PokemonResult] = []
    @Published var pokemonList = [Pokemon]()
    
    init()
    {
        fetchPokemons()
    }
    
    func fetchPokemons() {
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Error al traer los datos: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let pokemonListResponse = try JSONDecoder().decode(PokemonListResponse.self, from: data)
                DispatchQueue.main.async {
                    self.pokemonListTemporal = pokemonListResponse.results
                    self.fetchPokemonDetails()
                }
            } catch {
                print("Error en el JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func fetchPokemonDetails() {
        for pokemonResult in pokemonListTemporal {
            guard let url = URL(string: pokemonResult.url) else {
                print("URL inválida para el Pokémon: \(pokemonResult.name)")
                continue
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    print("Error al traer los datos del Pokémon: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                
                do {
                    var pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                    pokemon.name = pokemonResult.name
                    DispatchQueue.main.async {
                        let pokemonToAdd = pokemon
                        self.pokemonList.append(pokemonToAdd)
                    }
                } catch {
                    print("Error en el JSON del Pokémon: \(error.localizedDescription)")
                }
            }.resume()
        }
    }
}



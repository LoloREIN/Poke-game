//
//  PruebaAPI.swift
//  poke-adventru
//
//  Created by Rodrigo Consuelos on 07/06/24.
//

import SwiftUI

struct PruebaAPI: View {
    @StateObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.pokemones) { pokemon in
                VStack(alignment: .leading) {
                    Text(pokemon.name.capitalized)
                    Text(pokemon.url)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(pokemon.types[0])
                    Text(pokemon.sprite)
                }
            }
            .navigationTitle("Pokémon List")
            .onAppear {
                viewModel.fetchPokemon()
            }
        }
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            PruebaAPI()
        }
    }
}

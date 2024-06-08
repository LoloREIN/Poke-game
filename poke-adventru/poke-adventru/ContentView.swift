//
//  ContentView.swift
//  poke-adventru
//
//  Created by Rodrigo Consuelos on 08/06/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = PokemonViewModel()
        
        var body: some View {
            PokedexView()
                .onAppear {
                    // Llama a la función fetchPokemons() cuando la vista principal aparezca
                    viewModel.fetchPokemons()
                }
        }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            PokedexView()
        }
    }
}

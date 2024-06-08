//
//  PokedexView.swift
//  poke-adventru
//
//  Created by Rodrigo Consuelos on 07/06/24.
//

import SwiftUI

struct PokedexView: View {
    
    @ObservedObject var viewModel = PokemonViewModel()
    
    private let gridItems : [GridItem] = Array(repeating: GridItem.init(.flexible()),count: 2)
    
    var body: some View {
        NavigationStack
        {
            
            ScrollView
            {
                LazyVGrid(columns: gridItems,spacing: 16){
                    
                    ForEach(viewModel.pokemonList)
                    {
                        pokemon in
                        NavigationLink(destination:Destino(pokemon:pokemon,backgroundColor: getBackgroundColor(pokemon.types?.first?.type?.name)))
                        {
                            PokemonCell(pokemon:pokemon)
                        }
                    }
                }
            }.navigationTitle("Pokedex")
        }
    }
}

#Preview {
    PokedexView()
}

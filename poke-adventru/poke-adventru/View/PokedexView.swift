//
//  PokedexView.swift
//  poke-adventru
//
//  Created by Rodrigo Consuelos on 07/06/24.
//

import SwiftUI

struct PokedexView: View {
    private let gridItems : [GridItem] = Array(repeating: GridItem.init(.flexible()),count: 2)
    
    var body: some View {
        NavigationStack
        {
            ScrollView
            {
                LazyVGrid(columns: gridItems,spacing: 16){
                    
                    ForEach(0..<151)
                    {
                        _ in
                        Text("HOLA")
                    }
                }
            }.navigationTitle("Pokedex")
        }
    }
}

#Preview {
    PokedexView()
}

//
//  Pokemon.swift
//  poke-adventru
//
//  Created by Rodrigo Consuelos on 07/06/24.
//

import Foundation

struct PokemonResponse: Codable {
    let count: UInt32
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable {
    let id = UUID()
    let name: String
    let url: String
}





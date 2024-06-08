//
//  Pokemon.swift
//  poke-adventru
//
//  Created by Rodrigo Consuelos on 07/06/24.
//

import Foundation

struct Pokemon:  Identifiable {
    var id = UUID()
    let name: String
    let url: String
    let types : [String]
    let sprite : String
}


/*
struct PokemonData: Codable {
    let id: UInt32
    //let sprite: String
    //let stats: Stats
    let abilities: [Ability]
}
 */
/*
struct Stats: Codable {
    let hp: UInt8
    let attack: UInt8
    let defense: UInt8
    let specialAttack: UInt8
    let specialDefense: UInt8
    let speed: UInt8
}
*/
/*
struct Ability: Codable {
    let name: String
}
 */



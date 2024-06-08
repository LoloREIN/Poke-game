//
//  Pokemon.swift
//  poke-adventru
//
//  Created by Rodrigo Consuelos on 07/06/24.
//

import Foundation

struct PokemonListResponse: Codable {
    var results: [PokemonResult]
}

struct PokemonResult: Codable {
    var name: String
    var url: String
}


struct Pokemon: Codable, Identifiable {
    var id: UInt16
    var name: String
    var types: [TypeElement]?
    var sprites: Sprites?
    var stats: [StatElement]?
    var abilities: [AbilityElement]?
    var owned : Bool?
}

struct TypeElement: Codable {
    var type: TypeClass?
}

struct TypeClass: Codable {
    var name: String
}

struct Sprites: Codable {
    var front_default: String?
    var other: HomeSprites?
}

struct HomeSprites:Codable
{
    var home: Home?
}

struct Home:Codable
{
    var front_default : String?
}

struct StatElement: Codable {
    var base_stat: UInt8
    var stat: Stat
}

struct Stat: Codable {
    var name: String
}

struct AbilityElement: Codable {
    var ability: Ability

}

struct Ability: Codable {
    var name: String
}

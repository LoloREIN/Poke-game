//
//  PokemonCell.swift
//  poke-adventru
//
//  Created by Rodrigo Consuelos on 07/06/24.
//

import SwiftUI

struct PokemonCell: View {

    
    
    let pokemon: Pokemon
    private var backgroundColor: Color{
        return getBackgroundColor(pokemon.types?.first?.type?.name ?? "")
    }
    var body: some View
    {
        ZStack
        {
            VStack(alignment:.leading)
            {
                Text(pokemon.name.capitalized).font(.headline)
                    .foregroundStyle(.white)
                    .padding(.top,4)
                    .padding(.leading)
                HStack
                {
                    Text(pokemon.types?.first?.type?.name ?? "")
                        .padding(.vertical,8)
                        .padding(.horizontal,16)
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.white)
                        .background(Color.white.opacity(0.25))
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .frame(width: 100,height: 25)
                    
                    
                    if let imageUrl = URL(string: pokemon.sprites?.other?.home?.front_default ?? "") {
                        LazyImage(url: imageUrl)
                    } 
                    else if let imageUrl = URL(string: pokemon.sprites?.front_default ?? "") {
                        LazyImage(url: imageUrl)
                    } 
                    else {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .padding([.bottom, .trailing], 4)
                    }
                    
                    
                }
            }
        }.background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 15), style: FillStyle())
            .shadow(color: backgroundColor, radius: 8)
    }
    
    
}

func getBackgroundColor(_ pokemonType : String?) -> Color
{
    switch pokemonType?.lowercased() {
        case "normal":
            return Color.gray
        case "fighting":
            return Color.red
        case "flying":
            return Color.blue
        case "poison":
            return Color.purple
        case "ground":
            return Color(red: 0.8, green: 0.6, blue: 0.4)
        case "rock":
            return Color.gray
        case "bug":
            return Color.green
        case "ghost":
            return Color.gray
        case "steel":
            return Color(red: 0.6, green: 0.6, blue: 0.7)
        case "fire":
            return Color.red
        case "water":
            return Color.blue
        case "grass":
            return Color.green
        case "electric":
            return Color.yellow
        case "psychic":
            return Color(red: 1.0, green: 0.0, blue: 1.0)
        case "ice":
            return Color.blue
        case "dragon":
            return Color(red: 0.3, green: 0.3, blue: 0.8)
        case "dark":
            return Color(red: 0.3, green: 0.3, blue: 0.4)
        case "fairy":
            return Color(red: 1.0, green: 0.7, blue: 0.7)
        case "stellar":
            return Color.yellow
        default:
            return Color.gray
        }
}

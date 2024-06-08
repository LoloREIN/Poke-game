//
//  PokemonCell.swift
//  poke-adventru
//
//  Created by Rodrigo Consuelos on 07/06/24.
//

import SwiftUI

struct PokemonCell: View {

    //let pokemon : Pokemon
    var body: some View
    {
        ZStack
        {
            VStack(alignment:.leading)
            {
                Text("Bulbasaur").font(.headline)
                    .foregroundStyle(.white)
                    .padding(.top,4)
                    .padding(.leading)
                HStack
                {
                    Text("poison")
                        .padding(.vertical,8)
                        .padding(.horizontal,16)
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.white)
                        .background(Color.white.opacity(0.25))
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .frame(width: 100,height: 25)
                       
                    
                    Image("Bulbasaur").resizable()
                        .scaledToFit()
                        .frame(width: 70,height: 70)
                        .padding([.bottom,.trailing],4)
                }
            }
        }.background(.green)
            .clipShape(RoundedRectangle(cornerRadius: 15), style: FillStyle())
            .shadow(color: .green, radius: 8)
    }
}

#Preview {
    PokemonCell()
}

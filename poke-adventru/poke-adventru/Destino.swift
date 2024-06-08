//
//  Destino.swift
//  poke-adventru
//
//  Created by Rodrigo Consuelos on 08/06/24.
//

import SwiftUI

struct Destino: View {
    @Environment(\.dismiss) var dismiss
    let pokemon : Pokemon
    let backgroundColor : Color
    var body: some View {
        NavigationStack
        {
            ZStack(alignment:.top)
            {
                
                ZStack
                {
                    
                    VStack(spacing:12)
                    {
                        VStack(spacing:12)
                        {
                            Text(pokemon.name.capitalized).font(.largeTitle)
                            Text(pokemon.types?.first?.type?.name ?? "").font(.title3).padding(.vertical,4)
                                .padding(.horizontal,24)
                                .font(.subheadline)
                                .bold()
                                .background(backgroundColor)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                
                        }
                        
                        Spacer()
                        HStack
                        {
                            Text("Stats:").font(.title)
                            Spacer()
                        }.padding(.leading,20)
                        
                        List {
                            ForEach(pokemon.stats ?? [], id: \.stat.name) { stat in
                                HStack
                                {
                                    Text(stat.stat.name)
                                    Text(String(stat.base_stat))
                                    Spacer()
                                }
                            }
                        }.listStyle(PlainListStyle())
                            
                        
                        HStack
                        {
                            Text("Abilities:").font(.title)
                            Spacer()
                        }.padding(.leading,20)
                        if let abilities = pokemon.abilities
                        {
                            List {
                                ForEach(abilities, id: \.ability.name) { ability in
                                    Text(ability.ability.name)
                                }
                            }.listStyle(PlainListStyle())
                        }
                    }.padding(.top,40)
                    
                    
                }.frame(maxWidth: .infinity,maxHeight: .infinity).background(.white)
                    .padding(.top,320)
                
                ZStack
                {
                    if let imageUrl = URL(string: pokemon.sprites?.other?.home?.front_default ?? "") {
                        LazyImage(url: imageUrl, size: (width: 200, height: 200))
                            .padding(.top,130)

                    }
                    else {
                        if let imageUrl = URL(string: pokemon.sprites?.front_default ?? "") {
                            LazyImage(url: imageUrl, size: (width: 200, height: 200))
                                .padding(.top,130)
                        }
                        // Placeholder para imágenes que no se pueden cargar
                        Image(systemName: "photo")
                            .resizable()
                                .scaledToFit()
                                .frame(width: 200,height: 200)
                                .padding(.top,130)
                    }
                }
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .background(
                            LinearGradient(gradient: Gradient(colors: [backgroundColor, backgroundColor.opacity(0.2)]),
                                           startPoint: .top, endPoint: .bottom)
                        )
                .navigationBarBackButtonHidden(true) // Oculta el botón de retroceso predeterminado
                .toolbar {
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                            HStack {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white) // Cambia este color según tus necesidades
                                Text("Back")
                                    .foregroundColor(.white) // Cambia este color según tus necesidades
                            }
                        }
                    }
                }
        }
    }
}



//
//  QuestionView.swift
//  poke-adventru
//
//  Created by Lorenzo Reinoso on 09/06/24.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    //let pokemon: Pokemon
    
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Trivia Game")
                    .font(.title).colorInvert()
                
                Spacer()
                
                Text("\(triviaManager.index + 1) out of \(triviaManager.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: triviaManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                
                /*Text(triviaManager.currentPokemon.name)
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundColor(.gray)*/
                //ImagenPK().environmentObject(triviaManager)
                if let urlString = triviaManager.currentPokemon.sprites?.other?.home?.front_default ?? triviaManager.currentPokemon.sprites?.front_default,
                               let url = URL(string: urlString) {
                                        ImagenPK(imageUrl: url)
                            } else {
                                Text("No image available")
                            }
                
                ForEach(triviaManager.answerChoices, id: \.id) { answer in
                                    AnswerRow(answer: answer)
                                        .environmentObject(triviaManager)
                                }


            }
            
            Button {
                triviaManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: triviaManager.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            .disabled(!triviaManager.answerSelected)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        .navigationBarHidden(true)
    }
}


struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaManager())
    }
}

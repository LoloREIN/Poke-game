//
//  TriviaStart.swift
//  poke-adventru
//
//  Created by Lorenzo Reinoso on 09/06/24.
//

import SwiftUI

struct TriviaStart: View {
    @EnvironmentObject var triviaManager: TriviaManager
    @State private var navigateToTrivia = false

    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Poke-trivia")
                        .font(.title)

                    Text("Listo para ver tu conocimiento Pokemon")
                        .foregroundColor(Color("AccentColor"))
                }
                
                // Button to start trivia and navigate
                Button(action: {
                    // Start trivia
                    triviaManager.startTrivia()
                    // Navigate to TriviaView
                    navigateToTrivia = true
                }) {
                    PrimaryButton(text: "Catch them all!")
                }
                
                // NavigationLink with binding
                NavigationLink(
                    destination: TriviaView().environmentObject(triviaManager),
                    isActive: $navigateToTrivia
                ) {
                    EmptyView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        }
    }
}

#Preview {
    TriviaStart()
}

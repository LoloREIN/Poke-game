import Foundation
import SwiftUI

class TriviaManager: ObservableObject {
    @ObservedObject var viewModel = PokemonViewModel()
    @Published var pokemonTrivia: [Trivia.Result] = []
    @Published private(set) var currentPokemon: Pokemon = Pokemon(id: 52, name: "meowth", owned: nil)
    @Published private(set) var question: String = ""
    private(set) var trivia: [Trivia.Result] = []
    @Published private(set) var length = 10
    
    // Variables to set question and answers
    @Published private(set) var index = 0
    @Published private(set) var answerChoices: [Answer] = []
    
    // Variables for score and progress
    @Published private(set) var score = 0
    @Published private(set) var progress: CGFloat = 0.00
    
    // Variables to know if an answer has been selected and reached the end of trivia
    @Published private(set) var answerSelected = false
    @Published private(set) var reachedEnd = false
    

    init() {
        viewModel.fetchPokemons()
    }

    func startTrivia() {
        sleep(3)

        print(viewModel.pokemonList.count)
        guard viewModel.pokemonList.count >= 10 else {
            print("Not enough Pokémon to start trivia.")
            return
        }
        
        // Temporary list to modify without affecting the original list
        var tempPokemonList = viewModel.pokemonList
        
        // Clear previous trivia results if any
        pokemonTrivia.removeAll()
        DispatchQueue.main.async {
                        // Reset variables before assigning new values, for when the user plays the game another time
                        self.index = 0
                        self.score = 0
                        self.progress = 0.00
                        self.reachedEnd = false
                    }
        
        // Generate 10 trivia questions
        for _ in 1...length {
            // Select a random Pokémon index
            let randomIndex = Int.random(in: 0..<tempPokemonList.count)
            let pokemon = tempPokemonList[randomIndex]
            
            // Remove the selected Pokémon to avoid repetition
            tempPokemonList.remove(at: randomIndex)
            
            // Generate incorrect answers
            let incorrectAnswers = generateAnswers(pokemon: pokemon)
            
            // Create a trivia result
            let triviaResult = Trivia.Result(pokemon: pokemon, correctAnswer: pokemon.name, incorrectAnswers: incorrectAnswers)
            
            // Append to the trivia list
            pokemonTrivia.append(triviaResult)
        }
        self.setQuestion()
    }

    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double((index + 1)) / Double(length) * 350)

        // Only setting next question if index is smaller than the trivia's length
        if index < pokemonTrivia.count {
            let currentTriviaQuestion = pokemonTrivia[index]
            currentPokemon = currentTriviaQuestion.pokemon
            print(currentPokemon.name)
            answerChoices = currentTriviaQuestion.answers
        }
    }

    func generateAnswers(pokemon: Pokemon) -> [String] {
        var answers = [pokemon.name]
        while answers.count < 4 {
            if let randomPokemon = viewModel.pokemonList.randomElement(), !answers.contains(randomPokemon.name) {
                answers.append(randomPokemon.name)
            }
        }
        answers.removeFirst()
        return answers.shuffled()
    }

    func selectAnswer(answer: Answer) {
        answerSelected = true
        
        // If answer is correct, increment score
        if answer.isCorrect {
            score += 1
        }
    }

    func goToNextQuestion() {
        // If didn't reach end of array, increment index and set next question
        if index + 1 < pokemonTrivia.count {
            index += 1
            setQuestion()
        } else {
            // If reached end of array, set reachedEnd to true
            reachedEnd = true
        }
    }
}

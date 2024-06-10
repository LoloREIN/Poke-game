
import Foundation

struct Trivia: Decodable {
    var results: [Result]
    
    struct Result: Decodable, Identifiable {
        var id: UUID {
            UUID()
        }
        var pokemon: Pokemon
        var correctAnswer: String
        var incorrectAnswers: [String]
        
        var answers: [Answer] {
                   do {
                       // Formatting all answer strings into AttributedStrings and creating an instance of Answer for each
                       let correct = [Answer(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
                       let incorrects = try incorrectAnswers.map { answer in
                           Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                       }
                       
                       // Merging the correct and incorrect arrays together
                       let allAnswers = correct + incorrects
                       
                       // Shuffling the answers so the correct answer isn't always the first answer of the array
                       return allAnswers.shuffled()
                   } catch {
                       // If we run into an error, return an empty array
                       print("Error setting answers: \(error)")
                       return []
                   }
               }
    }
}

// Assuming Answer is defined as follows:
struct Answer: Identifiable {
    var id = UUID() // Setting the UUID ourselves inside of the model, because API doesn't return a unique ID for each answer
    var text: AttributedString
    var isCorrect: Bool
}


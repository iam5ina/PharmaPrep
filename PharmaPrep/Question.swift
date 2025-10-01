import Foundation

struct Question: Identifiable {
    let id = UUID()
    let prompt: String
    let options: [String]
    let correctAnswer: Int
    
    func isCorrect(_ index: Int) -> Bool {
        index == correctAnswer
    }
}

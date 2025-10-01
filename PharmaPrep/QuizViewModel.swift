import Combine
import SwiftUI
final class QuizViewModel: ObservableObject {
    @Published var questions: [Question] = []
    @Published var questionIndex: Int = 0
    @Published var selectedAnswerIndex: Int? = nil
    @Published var showFeedback: Bool = false
    @Published var score: Int = 0
    @Published var highScore: Int = 0
    @Published var isDarkMode: Bool = false
    @Published var reviewMode: Bool = false
    @Published var userAnswers: [UUID: Int] = [:]

    init() {
        self.questions = defaultQuestions.shuffled()
        self.highScore = UserDefaults.standard.integer(forKey: "highScore")
        self.isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
    }

    var currentQuestion: Question {
        guard questionIndex < questions.count else { return questions.last! }
        return questions[questionIndex]
    }

    var isQuizCompleted: Bool {
        questionIndex >= questions.count
    }

    func selectAnswer(index: Int) {
        guard !isQuizCompleted, selectedAnswerIndex == nil else { return }
        selectedAnswerIndex = index
        userAnswers[currentQuestion.id] = index

        if index == currentQuestion.correctAnswer {
            score += 1
            if score > highScore {
                highScore = score
                UserDefaults.standard.set(highScore, forKey: "highScore")
            }
        }
        withAnimation { showFeedback = true }
    }

    func nextQuestion() {
        if questionIndex + 1 < questions.count {
            questionIndex += 1
            selectedAnswerIndex = nil
            showFeedback = false
        } else {
            // Mark quiz as completed
            questionIndex += 1   // this is critical
            selectedAnswerIndex = nil
            showFeedback = false
        }
    }

    func resetGame() {
        questions = defaultQuestions.shuffled()
        questionIndex = 0
        selectedAnswerIndex = nil
        showFeedback = false
        score = 0
        reviewMode = false
        userAnswers = [:]
    }

    func toggleDarkMode() {
        isDarkMode.toggle()
        UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
    }

    func buttonColor(for index: Int) -> Color {
        guard let selected = selectedAnswerIndex else { return Color.gray.opacity(0.1) }
        if index == selected {
            return index == currentQuestion.correctAnswer ? Color.green.opacity(0.5) : Color.red.opacity(0.5)
        } else if index == currentQuestion.correctAnswer {
            return Color.green.opacity(0.3)
        }
        return Color.gray.opacity(0.1)
    }
}

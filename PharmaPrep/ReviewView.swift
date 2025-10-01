import SwiftUI

struct ReviewView: View {
    @EnvironmentObject var quizVM: QuizViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("📝 Review Answers")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                
                ForEach(quizVM.questions) { q in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(q.prompt)
                            .font(.headline)
                        
                        ForEach(0..<q.options.count, id: \.self) { i in
                            let isUserAnswer = quizVM.userAnswers[q.id] == i
                            let isCorrectAnswer = q.correctAnswer == i
                            
                            HStack {
                                Text(q.options[i])
                                    .foregroundColor(isCorrectAnswer ? .green : (isUserAnswer ? .red : .primary))
                                if isCorrectAnswer { Text("✓").foregroundColor(.green) }
                                else if isUserAnswer { Text("✗").foregroundColor(.red) }
                            }
                            .padding(.vertical, 2)
                        }
                    }
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(10)
                }
                
                Button("Back to Quiz") {
                    withAnimation { quizVM.reviewMode = false; quizVM.resetGame() }
                }
                .padding()
                .background(Color.blue.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom)
            }
            .padding()
        }
    }
}

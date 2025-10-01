import SwiftUI

struct ContentView: View {
    @EnvironmentObject var quizVM: QuizViewModel

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {

                // MARK: - Top Bar: Score & Dark Mode
                HStack {
                    VStack(alignment: .leading) {
                        Text("Score: \(quizVM.score)")
                        Text("High Score: \(quizVM.highScore)")
                    }
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Toggle(isOn: $quizVM.isDarkMode) {
                        Image(systemName: quizVM.isDarkMode ? "moon.fill" : "sun.max.fill")
                    }
                    .labelsHidden()
                    .toggleStyle(SwitchToggleStyle(tint: .blue))
                    .onChange(of: quizVM.isDarkMode) {
                          quizVM.toggleDarkMode()
                      }
                }
                .padding(.horizontal)
                
                Spacer()
                
                // MARK: - Review Mode
                if quizVM.reviewMode {
                    ReviewView()
                } else {
                    // MARK: - Quiz Flow
                    if !quizVM.isQuizCompleted {
                        let current = quizVM.currentQuestion
                        
                        Text(current.prompt)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        ForEach(0..<current.options.count, id: \.self) { i in
                            Button(action: {
                                quizVM.selectAnswer(index: i)
                            }) {
                                Text(current.options[i])
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(quizVM.buttonColor(for: i))
                                    .foregroundColor(.primary)
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.primary.opacity(0.1)))
                                    .cornerRadius(10)
                            }
                            .disabled(quizVM.selectedAnswerIndex != nil)
                        }
                        
                        // MARK: - Feedback & Next Button
                        if quizVM.showFeedback {
                            Text(quizVM.selectedAnswerIndex == current.correctAnswer
                                 ? "✅ Correct!"
                                 : "❌ Correct: \(current.options[current.correctAnswer])")
                                .font(.subheadline)
                                .foregroundColor(quizVM.selectedAnswerIndex == current.correctAnswer ? .green : .red)
                                .padding(.top, 10)
                            
                            Button("Next") {
                                withAnimation { quizVM.nextQuestion() }
                            }
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(8)
                        }
                        
                    } else {
                        // MARK: - Quiz Complete
                        VStack(spacing: 20) {
                            Text("🎉 Quiz Complete!\nYou scored \(quizVM.score) out of \(quizVM.questions.count).")
                                .font(.title2)
                                .multilineTextAlignment(.center)
                                .padding()
                            
                            HStack(spacing: 20) {
                                Button("Review Answers") {
                                    withAnimation { quizVM.reviewMode = true }
                                }
                                .padding()
                                .background(Color.orange.opacity(0.2))
                                .cornerRadius(10)
                                
                                Button("Play Again") {
                                    withAnimation { quizVM.resetGame() }
                                }
                                .padding()
                                .background(Color.green.opacity(0.2))
                                .cornerRadius(10)
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .preferredColorScheme(quizVM.isDarkMode ? .dark : .light)
            .padding()
            .navigationBarHidden(true)
        }
    }
}

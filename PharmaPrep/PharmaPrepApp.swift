import SwiftUI

@main
struct PharmaPrepApp: App {
    @StateObject private var quizVM = QuizViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(quizVM)
        }
    }
}

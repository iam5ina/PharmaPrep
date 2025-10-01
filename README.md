# 💊 PharmaPrep – Exam Practice App

PharmaPrep is an **iOS/iPadOS quiz application** built with **SwiftUI** that helps pharmacy students and professionals prepare for exams.  
It includes interactive quizzes, review mode, score tracking, and dark mode support.

---

## 🚀 Features

- ✅ Multiple-choice pharmacy exam questions  
- ✅ Immediate feedback (correct/incorrect)  
- ✅ Score tracking with high-score memory (saved between sessions)  
- ✅ Dark mode toggle  
- ✅ Review mode to go back through all questions and answers  
- ✅ “Play Again” option to retry with shuffled questions  

---

## 🖼️ Screenshots

| Quiz Question | Answer Feedback | Review Mode |
|---------------|----------------|-------------|
| <img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2025-09-30 at 20 33 48" src="https://github.com/user-attachments/assets/02827013-49fd-43b7-8ea7-fabf73b0c570"/> | <img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2025-09-30 at 20 33 53" src="https://github.com/user-attachments/assets/884d3978-cdfd-4a1c-9a17-7b9b85343a57" /> | <img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2025-09-30 at 20 34 09" src="https://github.com/user-attachments/assets/d15aae0f-593e-4bb3-a736-49a94c237b08" /> |

---

## 📲 Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/iam5ina/PharmaPrep-Exam-Practice-App.git
   cd PharmaPrep-Exam-Practice-App
   ```

2. Open the project in **Xcode (14.0 or later recommended)**:

   ```bash
   open PharmaPrep.xcodeproj
   ```

3. Build and run on the iOS Simulator or a real device.

---

## 🛠️ Tech Stack

* **Swift 5.9**
* **SwiftUI** for UI
* **MVVM architecture**
* **AppStorage & UserDefaults** for persistence

---

## 📚 Example Question

```swift
Question(
    prompt: "How long can insulin be stored at room temperature after first use?",
    options: ["14 days", "28 days", "8 weeks", "6 weeks"],
    correctAnswer: 1
)
```

---

## 🌟 Roadmap

* [ ] Add categories (e.g., Insulin, Antibiotics, Ophthalmics)
* [ ] Add timed exam mode
* [ ] Import/export custom question sets
* [ ] Statistics dashboard

---

## 👤 Author

Built by **Sina**
🔗 [GitHub Profile](https://github.com/iam5ina)

---

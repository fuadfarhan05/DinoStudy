import SwiftUI

struct FlashCard: Identifiable {
    let id = UUID()
    let word: String
}

struct ContentView: View {
    @State private var flashcards = [
        FlashCard(word: "a"),
        FlashCard(word: "about"),
        FlashCard(word: "all"),
        FlashCard(word: "am"),
        FlashCard(word: "an"),
        FlashCard(word: "and"),
        FlashCard(word: "are"),
        FlashCard(word: "as"),
        FlashCard(word: "at"),
        FlashCard(word: "be"),
        FlashCard(word: "been"),
        FlashCard(word: "but"),
        FlashCard(word: "by"),
        FlashCard(word: "can"),
        FlashCard(word: "come"),
        FlashCard(word: "could"),
        FlashCard(word: "did"),
        FlashCard(word: "do"),
        FlashCard(word: "down"),
        FlashCard(word: "each"),
        FlashCard(word: "find"),
        FlashCard(word: "first"),
        FlashCard(word: "for"),
        FlashCard(word: "from"),
        FlashCard(word: "get"),
        FlashCard(word: "go"),
        FlashCard(word: "had"),
        FlashCard(word: "has"),
        FlashCard(word: "have"),
        FlashCard(word: "he"),
        FlashCard(word: "her"),
        FlashCard(word: "him"),
        FlashCard(word: "his"),
        FlashCard(word: "how"),
        FlashCard(word: "I"),
        FlashCard(word: "if"),
        FlashCard(word: "in"),
        FlashCard(word: "into"),
        FlashCard(word: "is"),
        FlashCard(word: "it"),
        FlashCard(word: "like"),
        FlashCard(word: "look"),
        FlashCard(word: "make"),
        FlashCard(word: "many"),
        FlashCard(word: "me"),
        FlashCard(word: "my"),
        FlashCard(word: "no"),
        FlashCard(word: "not"),
        FlashCard(word: "now"),
        FlashCard(word: "of"),
        FlashCard(word: "on"),
        FlashCard(word: "one"),
        FlashCard(word: "only"),
        FlashCard(word: "or"),
        FlashCard(word: "other"),
        FlashCard(word: "out"),
        FlashCard(word: "people"),
        FlashCard(word: "said"),
        FlashCard(word: "see"),
        FlashCard(word: "first"),
        FlashCard(word: "for"),
        FlashCard(word: "from"),
        FlashCard(word: "go"),
        FlashCard(word: "had"),
        FlashCard(word: "has"),
        FlashCard(word: "have"),
        FlashCard(word: "he"),
        FlashCard(word: "her"),
        FlashCard(word: "here"),
        FlashCard(word: "him"),
        FlashCard(word: "his"),
        FlashCard(word: "how"),
        FlashCard(word: "I"),
        FlashCard(word: "if"),
        FlashCard(word: "in"),
        FlashCard(word: "into"),
        FlashCard(word: "is"),
        FlashCard(word: "it"),
        FlashCard(word: "like"),
        FlashCard(word: "look"),
        FlashCard(word: "make"),
        FlashCard(word: "many"),
        FlashCard(word: "me"),
        FlashCard(word: "more"),
        FlashCard(word: "my"),
        FlashCard(word: "no"),
        FlashCard(word: "not"),
        FlashCard(word: "now"),
        FlashCard(word: "number"),
        FlashCard(word: "of"),
        FlashCard(word: "on"),
        FlashCard(word: "one"),
        FlashCard(word: "or"),
        FlashCard(word: "other"),
        FlashCard(word: "out"),
        FlashCard(word: "people"),
        FlashCard(word: "right"),
        FlashCard(word: "said"),
        FlashCard(word: "see"),
        FlashCard(word: "she"),
        FlashCard(word: "so"),
        FlashCard(word: "some"),
        FlashCard(word: "that"),
        FlashCard(word: "the"),
        FlashCard(word: "their"),
        FlashCard(word: "them"),
        FlashCard(word: "then"),
        FlashCard(word: "there"),
        FlashCard(word: "these"),
        FlashCard(word: "they"),
        FlashCard(word: "this"),
        FlashCard(word: "to"),
        FlashCard(word: "two"),
        FlashCard(word: "up"),
        FlashCard(word: "use"),
        FlashCard(word: "very"),
        FlashCard(word: "was"),
        FlashCard(word: "water"),
        FlashCard(word: "we"),
        FlashCard(word: "were"),
        FlashCard(word: "what"),
        FlashCard(word: "when"),
        FlashCard(word: "where"),
        FlashCard(word: "which"),
        FlashCard(word: "who"),
        FlashCard(word: "will"),
        FlashCard(word: "with"),
        FlashCard(word: "word"),
        FlashCard(word: "would"),
        FlashCard(word: "write"),
        FlashCard(word: "you"),
        FlashCard(word: "your")
    ].shuffled()
    
    @State private var currentIndex = 0
    @State private var offset: CGSize = .zero
    @State private var correctAnswers = [FlashCard]()
    @State private var incorrectAnswers = [FlashCard]()
    
    var body: some View {
        VStack {
            if currentIndex < flashcards.count {
                Image("prompt")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:500)
                
                CardView(flashcard: flashcards[currentIndex])
                    .offset(offset)
                    .rotationEffect(.degrees(Double(offset.width / 10)))
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                offset = gesture.translation
                            }
                            .onEnded { _ in
                                if offset.width > 100 {
                                    correctAnswers.append(flashcards[currentIndex])
                                    currentIndex += 1
                                    offset = .zero
                                } else if offset.width < -100 {
                                    incorrectAnswers.append(flashcards[currentIndex])
                                    currentIndex += 1
                                    offset = .zero
                                } else {
                                    offset = .zero
                                }
                            }
                    )
            } else {
                VStack {
                    Text("Flashcards Completed!")
                        .font(.largeTitle)
                        .padding()
                    
                    Text("Correct Answers: \(correctAnswers.count)")
                    Text("Incorrect Answers: \(incorrectAnswers.count)")
                }
            }
        }
    }
}

struct CardView: View {
    let flashcard: FlashCard
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .shadow(radius: 10)
            
            Text(flashcard.word)
                .font(.largeTitle)
                .foregroundColor(.black)
        }
        .frame(width: 300, height: 200)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

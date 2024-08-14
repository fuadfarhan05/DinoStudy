import SwiftUI

struct WordFossil: View {
    @State private var tiles: [[Tile]] = generateTiles()
    @State private var targetWord: String = ""
    @State private var score: Int = 0
    @State private var matchedWords: Set<String> = []
    
    var body: some View {
        VStack {
            Text("\(targetWord)")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.black)
                .fontWeight(.bold)
            
            ZStack{
                Image("backdrop")
                    .resizable()
                    .frame(width: 430, height:430)
                VStack {
                    ForEach(0..<tiles.count, id: \.self) { row in
                        HStack {
                            ForEach(0..<tiles[row].count, id: \.self) { col in
                                TileView(tile: $tiles[row][col])
                                    .frame(width: 100, height: 100)
                                    .background(tiles[row][col].isMatched ? Color.green : Color.brown)
                                    .cornerRadius(8)
                                    .onTapGesture {
                                        if tiles[row][col].word == targetWord {
                                            tiles[row][col].isMatched = true
                                            score += 1
                                            matchedWords.insert(tiles[row][col].word)
                                            newRound()
                                        }
                                    }
                                    .padding(4)
                            }
                        }
                    }
                }
            }
            .padding()
            HStack{
                Image("score")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:150)
                Text("\(score)")
                    .font(.title)
                    .padding()
                    .fontWeight(.bold)
            }
        }
        .onAppear(perform: newRound)
    }
    
    private func newRound() {
        // Filter out matched words and select a new target word
        let remainingWords = tiles.flatMap { $0 }
            .filter { !matchedWords.contains($0.word) }
            .map { $0.word }
        
        if let newTargetWord = remainingWords.randomElement() {
            targetWord = newTargetWord
        } else {
            targetWord = "You found the Fossils!!"
        }
    }
}

struct TileView: View {
    @Binding var tile: Tile
    
    var body: some View {
        ZStack {
            Text(tile.word)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(tile.isMatched ? .white : .white)
        }
        .frame(width: 100, height: 100)
        .background(tile.isMatched ? Color.green : Color.brown)
        .cornerRadius(8)
        .border(Color.black, width: 5)
        .cornerRadius(10)
    }
}

struct Tile: Identifiable {
    let id = UUID()
    let word: String
    var isMatched: Bool = false
}

func generateTiles() -> [[Tile]] {
    let words = ["you", "then", "there", "see", "where", "went", "were", "are", "and"]
    var tiles: [[Tile]] = []
    
    // Shuffle the words and ensure uniqueness
    let shuffledWords = words.shuffled().prefix(9)
    
    for row in 0..<3 {
        var rowTiles: [Tile] = []
        for col in 0..<3 {
            let index = row * 3 + col
            if index < shuffledWords.count {
                let word = shuffledWords[index]
                rowTiles.append(Tile(word: word))
            }
        }
        tiles.append(rowTiles)
    }
    
    return tiles
}

struct WordFossil_Previews: PreviewProvider {
    static var previews: some View {
        WordFossil()
    }
}

//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by macbook on 17.12.2023.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String>
    
    var theme: Theme
    private var lastThemeIndex: Int = 0
    
    var score: Int {
        return model.score
    }
    
    private static let themes: [Theme] = [
        Theme(name: "Vehicles",
              emojis: ["🚗", "🚕", "🚙", "🚌", "🏎️", "🚓", "🚑", "🚒", "🚐"],
              numberOfPairs: 8,
              color: "purple"),
        
        Theme(name: "Animals",
              emojis: ["😺", "🦁", "🐰", "🐭", "🐼", "🦊", "🐶", "🐯", "🐨"],
              numberOfPairs: 8,
              color: "green"),
        
        Theme(name: "Halloween",
              emojis: ["👻", "😈", "🎃", "☠️", "🧟‍♀️", "🧛🏻", "🧙🏻‍♀️", "🧌", "🦇"],
              numberOfPairs: 8,
              color: "brown"),
        
        Theme(name: "Bugs",
              emojis: ["🐝", "🐛", "🦋", "🦟", "🐜", "🐞", "🦗", "🪳", "🪲"],
              numberOfPairs: 8,
              color: "blue"),
        
        Theme(name: "Fruits",
              emojis: ["🍏", "🍐", "🍎", "🍌", "🍉", "🫐", "🍓", "🍒", "🥝"],
              numberOfPairs: 8,
              color: "yellow"),
        
        Theme(name: "Spot",
              emojis: ["🥊", "🥋", "⛸️", "🛹", "🏓", "🏀", "⚽️", "🎾", "🏋🏻"],
              numberOfPairs: 8,
              color: "pink"),
    ]
    
    
    
    private static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            if theme.emojis.indices.contains(pairIndex) {
                return theme.emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    init() {
        theme = EmojiMemoryGame.themes[lastThemeIndex]
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    func newGame() {
        lastThemeIndex = Int.random(in: 0..<EmojiMemoryGame.themes.count)
        theme = EmojiMemoryGame.themes[lastThemeIndex]
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
        model.shuffle()
    }
    
    func cardColor(for card: MemoryGame<String>.Card) -> Color {
        let themeColor = theme.color
        switch themeColor {
        case "purple":
            return .purple
        case "green":
            return .green
        case "brown":
            return .brown
        case "blue":
            return .blue
        case "yellow":
            return .yellow
        case "pink":
            return .pink
        default:
            return .black
        }
    }
    
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    
    //MARK: - Intents -
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

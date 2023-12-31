//
//  MemorizeGame.swift
//  Memorize
//
//  Created by macbook on 17.12.2023.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    private(set) var score = 0
    private var seenCards = Set<String>()
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    
    mutating func choose(_ card: Card) {
            if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
                if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                    if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                        if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                            cards[chosenIndex].isMatched = true
                            cards[potentialMatchIndex].isMatched = true
                            score += 2
                        } else {
                            if seenCards.contains(cards[chosenIndex].id) {
                                score -= 1
                            }
                            if seenCards.contains(cards[potentialMatchIndex].id) {
                                score -= 1
                            }
                        }
                        seenCards.insert(cards[chosenIndex].id)
                        seenCards.insert(cards[potentialMatchIndex].id)
                    } else {
                        indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                    }
                    cards[chosenIndex].isFaceUp = true
                }
            }
        }

    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        var id: String
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down")\(isMatched ? "matched" : "")"
        }
    }
    
    
}

struct Theme {
    let name: String
    let emojis: [String]
    let numberOfPairs: Int
    let color: String
}

extension Array {
    var only: Element? {
          count == 1 ? first : nil
    }
}

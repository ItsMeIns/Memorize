//
//  CardView.swift
//  Memorize
//
//  Created by macbook on 15.12.2023.
//

import SwiftUI

struct CardView: View {
   
    var card: MemoryGame<String>.Card
    var cardColor: Color
    
    init(_ card: MemoryGame<String>.Card, cardColor: Color) {
        self.card = card
        self.cardColor = cardColor
    }
    
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
                .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .foregroundColor((card.isFaceUp ? .white : cardColor))
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}



//
//  ContentView.swift
//  Memorize
//
//  Created by macbook on 14.12.2023.
//

import SwiftUI


struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    
    var body: some View {
        VStack {
          
            Text(viewModel.theme.name)
                .font(.title).bold()
                .padding()
            
            Text("Score: \(viewModel.score)")
            
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            
            Button("New Game") {
                viewModel.newGame()
            }
            .font(.title).bold()
            .padding()
            
        }
        .padding()
        
        
    }
    
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            
            ForEach(viewModel.cards) { card in
                CardView(card, cardColor: viewModel.cardColor(for: card))
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
    }
    
    
}






#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}






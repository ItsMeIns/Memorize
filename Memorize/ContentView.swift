//
//  ContentView.swift
//  Memorize
//
//  Created by macbook on 14.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["👻", "🐧", "🐣", "🐽", "🕸️", "🦀", "🦅", "🦭", "🦕", "🪱", "🦋", "⭐️"]
    @State private var cardCount = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
                Spacer()
                cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(Color.purple)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus")
    }
}


#Preview {
    ContentView()
}




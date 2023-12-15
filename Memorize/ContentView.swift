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
            cards
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        HStack {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
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
    
    var cardRemover: some View {
        Button(action: {
            if cardCount > 1 {
                cardCount -= 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.minus")
        })
    }
    
    var cardAdder: some View {
        Button(action: {
            if cardCount < emojis.count {
                cardCount += 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.plus")
        })
    }
}


#Preview {
    ContentView()
}




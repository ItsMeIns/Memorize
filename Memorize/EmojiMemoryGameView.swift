//
//  ContentView.swift
//  Memorize
//
//  Created by macbook on 14.12.2023.
//

import SwiftUI


struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
//    @State private var currentTheme: Theme = .vehicles
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            
            ScrollView {
                cards
            }
            .padding()
            
            Spacer()
            
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        
//        themeButton
    }
    
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(Color.purple)
    }
    
    //MARK: - theme -
    var themeButton: some View {
        HStack(spacing: 50) {
//            vehicle
//            animal
//            fruits
        }
        .imageScale(.medium)
        .font(.headline)
        .padding()
    }
    
//    func themeAdjuster(by theme: Theme, symbol: String, text: String) -> some View {
//        Button(action: {
////            currentTheme = theme
//        }, label: {
//            VStack {
//                Image(systemName: symbol)
//                Text(text)
//            }
//        })
//    }
    
//    var vehicle: some View {
//        themeAdjuster(by: viewModel.cards, symbol: "car", text: "Vehicles")
//    }
    
//    var animal: some View {
//        themeAdjuster(by: .animals, symbol: "cat", text: "Animals")
//    }
//    
//    var fruits: some View {
//        themeAdjuster(by: .fruits, symbol: "carrot", text: "Fruits")
//    }
    
    
}
#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}






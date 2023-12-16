//
//  ContentView.swift
//  Memorize
//
//  Created by macbook on 14.12.2023.
//

import SwiftUI


struct GameView: View {
    
    @State private var currentTheme: Theme = .vehicles
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            
            ScrollView {
                cards
            }
            Spacer()
            themeButton
            
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
            
            ForEach(currentTheme.emojis.indices, id: \.self) { index in
                CardView(content: currentTheme.emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(Color.purple)
    }
    
    //MARK: - theme -
    var themeButton: some View {
        HStack {
            vehicle
            Spacer()
            animal
            Spacer()
            fruits
        }
        .imageScale(.medium)
        .font(.headline)
        .padding()
    }
    
    func themeAdjuster(by theme: Theme, symbol: String, text: String) -> some View {
        Button(action: {
            currentTheme = theme
        }, label: {
            VStack {
                Image(systemName: symbol)
                Text(text)
            }
        })
    }
    
    var vehicle: some View {
        themeAdjuster(by: .vehicles, symbol: "car", text: "Vehicles")
    }
    
    var animal: some View {
        themeAdjuster(by: .animals, symbol: "cat", text: "Animals")
    }
    
    var fruits: some View {
        themeAdjuster(by: .fruits, symbol: "carrot", text: "Fruits")
    }
    
    
}
#Preview {
    GameView()
}




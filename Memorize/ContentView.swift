//
//  ContentView.swift
//  Memorize
//
//  Created by macbook on 14.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            cardView(isFaceUp: true)
            cardView()
            cardView()
            cardView()
        }
        .foregroundColor(Color.purple)
        .padding()
    }
}

#Preview {
    ContentView()
}


struct cardView: View {
    
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}

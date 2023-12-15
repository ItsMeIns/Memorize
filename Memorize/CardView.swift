//
//  CardView.swift
//  Memorize
//
//  Created by macbook on 15.12.2023.
//

import SwiftUI

struct CardView: View {
    let content: String
    @State private var isFaceUp = false
    
    var body: some View {
        ZStack {
            
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}



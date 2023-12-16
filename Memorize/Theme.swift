//
//  Theme.swift
//  Memorize
//
//  Created by macbook on 16.12.2023.
//

import Foundation

enum Theme {
    case vehicles
    case animals
    case fruits
    
    var emojis: [String] {
        switch self {
        case .vehicles:
            return ["🚗", "🚕", "🚙", "🚌", "🚗", "🚕", "🚙", "🚌", "🏎️", "🚓", "🚑", "🚒", "🚐", "🏎️", "🚓", "🚑", "🚒", "🚐", ].shuffled()
        case .animals:
            return ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨"].shuffled()
        case .fruits:
            return ["🍎", "🍊", "🍋", "🍉", "🍇", "🍓", "🍒", "🥝", "🍍", "🍑", "🥥", "🥭", "🍎", "🍊", "🍋", "🍉", "🍇", "🍓", "🍒", "🥝", "🍍", "🍑", "🥥", "🥭"].shuffled()
        }
    }
}

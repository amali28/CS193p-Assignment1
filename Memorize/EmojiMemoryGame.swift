//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ali Malik on 2021-12-08.
//

// ViewModel

import SwiftUI

class EmojiMemoryGame {
    
    static let sportsEmojis = ["⚽","⚾","🏀","🏐","🏈", "🏉", "🎾", "🥏", "🎳", "🏏", "🏑", "🏒","🥍","🏓","🏸","🥊","🥋","🥅","⛳","⛸️","🎣","🎽", "🎿", "🛷" ,"🥌", "⛸️", "🏹", "🏃‍♀️"]
    static let countryEmojis = ["🇦🇫", "🇦🇽", "🇦🇱", "🇦🇲", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇮🇶", "🇮🇹", "🇯🇵", "🇯🇴", "🇰🇷", "🇱🇧", "🇱🇷", "🇱🇾", "🇲🇽", "🇵🇸", "🇺🇸", "🇸🇦", "🇦🇪", "🇬🇧", "🇻🇳", "🇹🇷", "🇹🇴", "🇿🇦"]
    static let vehicleEmojis = ["🚂", "🚀", "🚁", "🚜", "🏎", "🚌", "🚍","🚎", "🚐", "🚑", "🚲", "🛵", "🚚", "🛺", "🦼", "🏍", "🛻", "🚗", "🚙", "🚕", "🚛","🚔","🚠", "🛳"]
    
    private var model = MemoryGame<String>(numberOfPairsCards: 4) {pairIndex in
        sportsEmojis[pairIndex]
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
}

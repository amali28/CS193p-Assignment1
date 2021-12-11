//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ali Malik on 2021-12-08.
//

// Model

import Foundation

struct MemoryGame <CardContent>{
    var cards: Array<Card>
    
    func choose (_ card: Card){
        
    }
    
    init(numberOfPairsCards: Int, createCardContent: (Int) -> CardContent ){
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsCards{
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        
    }
    
    struct Card {
        var isFaceup = false
        var isMatched = false
        var content: CardContent
    }
}

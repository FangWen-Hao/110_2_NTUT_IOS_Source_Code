//
//  Card.swift
//  Lab05
//
//  Created by Admin on 2022/4/18.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var iconIndex: Int
    
    static var iconIndexFactory = 0
    static func getUniqueIndex() -> Int {
        iconIndexFactory += 1
        return iconIndexFactory
    }
    
    init(iconIndex: Int) {
        self.iconIndex = Card.getUniqueIndex()
    }
}

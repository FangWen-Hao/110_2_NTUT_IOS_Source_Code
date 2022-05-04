//
//  CalculatorBrainCell.swift
//  MidtermProject_FullCalculator
//
//  Created by Admin on 2022/5/4.
//

import Foundation

struct CalculatorBrainCell<Element> {
    
    private var items = [Element]()
    
    mutating func pop() ->Element? {return items.removeLast()}
    mutating func push(item:Element) {items.append(item)}
    
    func elementCount() -> Int! {return items.count}
    func isElementEmpty() -> Bool {return items.isEmpty}
}

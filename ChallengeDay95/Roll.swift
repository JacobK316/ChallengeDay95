//
//  Roll.swift
//  ChallengeDay95
//
//  Created by Jacob Kappler on 1/15/26.
//

import Foundation
import SwiftData

@Model
class Roll {
    var sides: Int
    var diceTotal: Int
    var amountOfDice: Int
    var rolls: [Int]
    
    init(sides: Int, diceTotal: Int, amountOfDice: Int, rolls: [Int]) {
        self.sides = sides
        self.diceTotal = diceTotal
        self.amountOfDice = amountOfDice
        self.rolls = rolls
    }
}

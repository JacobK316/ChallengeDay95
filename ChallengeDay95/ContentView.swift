//
//  ContentView.swift
//  ChallengeDay95
//
//  Created by Jacob Kappler on 1/15/26.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    let sidesChoices = [4, 6, 8, 10, 12, 20, 50]
    @State private var sides = 6
    @State private var diceTotal = 0
    @State private var rolls = [Int]()
    @State private var amountOfDice = 2
    var body: some View {
        NavigationStack {
            Form {
                Picker("How many sides for your dice?", selection: $sides) {
                    ForEach(sidesChoices, id: \.self) { side in
                        Text("\(side)")
                    }
                }
                Picker("How many dice to roll?", selection: $amountOfDice) {
                    ForEach(1..<10, id: \.self) { die in
                        Text("\(die)")
                    }
                }
                
                Button("Role Dice", action: rollDice)
                
                Text("Total: \(diceTotal)")
                
                ForEach(Array(rolls.enumerated()), id: \.element) { number, roll in
                    Text("Dice \(number + 1): \(roll)")
                }
            }
            .toolbar {
                NavigationLink("Rolls") {
                    RollHistoryView()
                }
            }
        }
    }
    
    func rollDice() {
        rolls.removeAll()
        var total = 0
        for _ in 0..<amountOfDice {
            let roll = Int.random(in: 1...sides)
            total += roll
            rolls.append(roll)
        }
        diceTotal = total

        let newRoll = Roll(sides: sides, diceTotal: diceTotal, amountOfDice: amountOfDice, rolls: rolls)
        modelContext.insert(newRoll)
    }
}

#Preview {
    ContentView()
}

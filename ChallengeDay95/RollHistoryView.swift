//
//  RollHistoryView.swift
//  ChallengeDay95
//
//  Created by Jacob Kappler on 1/15/26.
//

import SwiftData
import SwiftUI

struct RollHistoryView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Roll.amountOfDice, order: .reverse) var diceRolls: [Roll]
    var body: some View {
        NavigationStack {
            List {
                ForEach(diceRolls) { diceRoll in
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Dice: \(diceRoll.amountOfDice)")
                                .font(.headline)
                            Spacer()
                            Text("Total: \(diceRoll.diceTotal)")
                            
                            
                            ///ForEach for later use for each roll
                            /*
                             ForEach(diceRoll.rolls, id: \.self) { roll in
                             Text("Roll: \(roll)")
                             }
                             */
                        }
                        Text("Sides: \(diceRoll.sides)")
                            .foregroundStyle(.secondary)
                    }
                }
                .onDelete(perform: deleteRoll)
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    func deleteRoll(at offsets: IndexSet) {
        for offset in offsets {
            let roll = diceRolls[offset]
            modelContext.delete(roll)
        }
    }
}

#Preview {
    RollHistoryView()
}

//
//  ContentView.swift
//  ChallengeDay95
//
//  Created by Jacob Kappler on 1/15/26.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0
    var body: some View {
        NavigationStack {
            Text("\(count)")
            Button("Tap Me") {
                count += 1
            }
            .navigationTitle("Title")
        }
    }
}

#Preview {
    ContentView()
}

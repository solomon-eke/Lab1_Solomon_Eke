//
//  ContentView.swift
//  Lab1_Solomon_Eke
//
//  Created by Solomon Eke on 2025-02-09.
//

import SwiftUI

struct ContentView: View {
    // State variables to track the current number, correct and wrong answers, and UI feedback
    @State private var currentNumber = Int.random(in: 1...200)
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

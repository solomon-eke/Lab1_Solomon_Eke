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
    // Generates a random number between 1 and 100
    @State private var correctAnswers = 0 // Tracks the number of correct answers
    @State private var wrongAnswers = 0 // Tracks the number of wrong answers
    @State private var showResult = false // Determines if the results alert should be displayed
    @State private var showTick = false // Controls the visibility of the green tick image
    @State private var showCross = false // Controls the visibility of the red cross image
    @State private var attemptCount = 0 // Tracks the number of attempts made
    @State private var timer: Timer? // Timer to track the 5-second interval for user input
    var body: some View {
        VStack {
            // Display the current number
            Text("\(currentNumber)")
                .font(.system(size: 100, weight: .bold)) // Large bold font for visibility
                .padding()
            HStack {
                // Button for "Prime" selection
                Button(action: {
                    checkAnswer(isPrime: true) // Calls function to check if the number is prime
                }) {
                    Text("Prime")
                        .font(.title) // Sets text to title size
                        .padding() // Adds padding for better spacing
                        .background(Color.blue) // Sets background color to blue
                        .foregroundColor(.white) // Sets text color to white
                        .cornerRadius(10) // Rounds the button corners
                }
                
                // Button for "Not Prime" selection
                Button(action: {
                    checkAnswer(isPrime: false) // Calls function to check if the number is not prime
                }) {
                    Text("Not Prime")
                        .font(.title) // Sets text to title size
                        .padding() // Adds padding for better spacing
                        .background(Color.red) // Sets background color to red
                        .foregroundColor(.white) // Sets text color to white
                        .cornerRadius(10) // Rounds the button corners
                }
            }
            
            .padding()
            
            // Display "Right ✅" when the answer is correct, or "Wrong ❌" when it's incorrect
            if showTick {
                Text("Right ✅")
                    .font(.title)
                    .foregroundColor(.green)
                    .padding()
            }

            if showCross {
                Text("Wrong ❌")
                    .font(.title)
                    .foregroundColor(.red)
                    .padding()
            }

        }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Lab1_Solomon_Eke
//
//  Created by Solomon Eke on 2025-02-09.
//


import SwiftUI

struct ContentView: View {
    // State variables to track the current number, correct and wrong answers, and UI feedback
    @State private var currentNumber = Int.random(in: 1...200) // Generates a random number between 1 and 100
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
        // Display an alert every 10 attempts showing the user's score
        .alert(isPresented: $showResult) {
            Alert(title: Text("Results"), message: Text("Correct: \(correctAnswers)\nWrong: \(wrongAnswers)"), dismissButton: .default(Text("OK")))
        }
        .onAppear(perform: startTimer) // Starts the timer when the view appears
    }
    
    // Function to check if the user's selection is correct
    func checkAnswer(isPrime: Bool) {
        if isPrime == isNumberPrime(currentNumber) {
            correctAnswers += 1
            showTick = true
            showCross = false
        } else {
            wrongAnswers += 1
            showCross = true
            showTick = false
        }

        // Keep the result visible for 1 second before changing the number
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.showTick = false
            self.showCross = false
            self.nextNumber()
        }
    }

    
    // Function to determine if a number is prime
    func isNumberPrime(_ num: Int) -> Bool {
        if num < 2 { return false } // Numbers less than 2 are not prime
        for i in 2..<num {
            if num % i == 0 {
                return false // If divisible by any number other than 1 and itself, return false
            }
        }
        return true // Otherwise, return true (number is prime)
    }
    
 
    
    // Function to start the timer
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            wrongAnswers += 1 // Increment wrong answers if no selection is made within 5 seconds
            nextNumber() // Move to the next number
        }
    }
    
    // Function to reset the timer when a new number is displayed
    func resetTimer() {
        timer?.invalidate() // Invalidate the current timer
        startTimer() // Restart the timer
    }
}

// Preview provider for SwiftUI live preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

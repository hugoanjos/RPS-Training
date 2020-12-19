//
//  ContentView.swift
//  RPS Training
//
//  Created by Hugo Anjos on 18/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var currentMove = Int.random(in: 0...2)
    @State private var winCondition = Bool.random()
    @State private var score = 0
    @State private var lives = 3
    
    @State private var gameEnd = false
    @State private var scoreTitle = ""
    
    @State private var moves = ["✊", "✋", "✌️"]
    
    @AppStorage("highscore") var highscore: Int = 0
    
    var body: some View {
        
        VStack(spacing: 100) {
            VStack(spacing: 50) {
                Text("""
                    Player Score: \(score)
                    Lives left: \(lives)
                    """)
                    .multilineTextAlignment(.center)
                
                VStack {
                    Text("The move is:")
                    Text(moves[currentMove])
                        .font(.system(size: 60))
                        .fontWeight(.black)
                }
                
                HStack {
                    Text("You need to ") +
                    Text(winCondition ? "WIN" : "LOSE")
                        .foregroundColor(winCondition ? .green : .red)
                        .fontWeight(.bold)
                }
                .font(.largeTitle)
            }
            .font(.title)
            .foregroundColor(.primary)
            
            // Moves
            HStack(spacing:10) {
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.optionSelected(number)
                    }) {
                        Text(self.moves[number])
                            .foregroundColor(.primary)
                            .font(.system(size: 60))
                    }
                }
            }
        }
        
        // Game over alert
        .alert(isPresented: $gameEnd) {
                        Alert(title: Text(scoreTitle), message: Text("High score: \(highscore)"), dismissButton: .default(Text("Try Again")) {
                            self.restartGame()
                        })
                    }
    }
    
    // Gives a new move and win condition
    func newMove() {
        currentMove = Int.random(in: 0...2)
        winCondition = Bool.random()
    }
    
    // Called after pressing Try Again when game ends
    func restartGame() {
        score = 0
        lives = 3
        self.newMove()
    }
    
    // Checks to see if the answer is correct
    func optionSelected(_ number: Int) {
        var winMove: Int
        
        // Assigns the right answer to winMove
        if winCondition {
            winMove = (currentMove + 1) % moves.count
        } else {
            winMove = (currentMove + 2) % moves.count
        }

        // If it is the right answer, scores, else, remove life
        number == winMove ? (score += 1) : (lives -= 1)
        
        // Check to see if the game ended
        if lives > 0 {
            self.newMove()
        } else {
            if score > highscore {
                highscore = score
                scoreTitle = "New high score!"
            } else {
                scoreTitle = "Your score was \(score)"
            }
            gameEnd = true
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

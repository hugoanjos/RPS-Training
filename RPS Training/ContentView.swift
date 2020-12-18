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
        
        .alert(isPresented: $gameEnd) {
                        Alert(title: Text(scoreTitle), message: Text("Your score was \(score)"), dismissButton: .default(Text("Try Again")) {
                            self.restartGame()
                        })
                    }
    }
    
    func newMove() {
        currentMove = Int.random(in: 0...2)
        winCondition = Bool.random()
    }
    
    func restartGame() {
        score = 0
        lives = 3
        self.newMove()
    }
    
    func optionSelected(_ number: Int) {
        var winMove: Int
        
        if winCondition {
            winMove = (currentMove + 1) % moves.count
        } else {
            winMove = (currentMove - 1) % moves.count
        }
        
        number == winMove ? (score += 1) : (lives -= 1)
        
        if lives > 0 {
            self.newMove()
        } else {
            gameEnd = true
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

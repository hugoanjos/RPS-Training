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
    
    private var moves = ["Rock", "Paper", "Scissors"]
    
    var body: some View {
        
        VStack(spacing: 150) {
            VStack(spacing: 50) {
                Text("Player Score: 0")
                
                VStack {
                    Text("The move is:")
                    Text(moves[currentMove])
                        .font(.largeTitle)
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
            .foregroundColor(.white)
            
            HStack(spacing:10) {
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        // botão
                    }) {
                        Text(self.moves[number])
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            ContentView()
        }
    }
}

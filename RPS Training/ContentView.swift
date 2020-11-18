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
        ZStack {
            Color.black.ignoresSafeArea(.all)
            VStack(spacing: 150) {
                
                VStack(spacing: 50) {
                    Text("Player Score: 0")
                        .foregroundColor(.white)
                        .font(.title)
                    
                    VStack {
                        Text("The move is:")
                            .foregroundColor(.white)
                            .font(.title)
                        Text(moves[currentMove])
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.black)
                    }
                    
                    if winCondition {
                        HStack {
                            Text("You need to")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                            Text("WIN")
                                .foregroundColor(.green)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                        }
                    } else {
                        HStack {
                            Text("You need to")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                            Text("LOSE")
                                .foregroundColor(.red)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                        }
                    }
                }
                
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

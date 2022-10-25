//
//  SwiftUIViewMy.swift
//  RockPaperScissors
//
//  Created by Aleksey Nosik on 03.10.2022.
//

import SwiftUI

struct SwiftUIViewMy: View {
    
    @State private var currentScore = 0
    @State private var currentQuestion = 1
    @State private var isShowingScore = false

    @State private var imageNumber = Int.random(in: 0...2)
    @State private var targetNumber = Int.random(in: 0...1)
    
    @State private var mainImage = ["PAPER", "ROCK", "SCISSORS"]
    @State private var mainTarget = ["WIN", "LOSE"]
    
    //let arrayOfImage = ["PAPER", "ROCK", "SCISSORS"]


    
    
    
    var body: some View {
        VStack {
            Color.yellow
                .ignoresSafeArea()
            
            VStack {
                Text("RPS Game")
                    .font(.largeTitle.bold())
                Text("Quest \(currentQuestion)/10")
                Image(mainImage[imageNumber])
                
                Text(mainTarget[targetNumber])
                    .font(.largeTitle.bold())
                    .padding(.bottom, 10)
            }
            .background(.yellow)
            .padding(.top, -20)
            
            HStack {
                ForEach(0..<3) { number in
                    Button {
                        tapToButton(number)
                    } label: {
                        Spacer()

                        Image(mainImage[number])
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                            .shadow(radius: 30)
                        
                        Spacer()
                    }
                }
            }
                
            Text("Score: \(currentScore)")
                .font(.title.bold())
        }
        .background(.yellow)
        .alert("Game over. Your score: \(currentScore)", isPresented: $isShowingScore) {
            Button("New Game", action: gameOver)
        }
    }
    
    
    func tapToButton(_ playerChoice: Int) {
        var actualResult = Int()
        
        switch (playerChoice, imageNumber) {
        case (0, 1), (1, 2), (2, 0):
            actualResult = 0
        case (0, 2), (2, 1), (1, 0):
            actualResult = 1
        default:
            actualResult = 2
        }
        

        if actualResult == targetNumber {
            currentScore += 1
        } else {
            currentScore -= 1
        }
            
        currentQuestion += 1
        
        if currentQuestion > 10 {
            isShowingScore = true
        }
        
        imageNumber = Int.random(in: 0...2)
        targetNumber = Int.random(in: 0...1)
    }
    
    func gameOver() {
        currentQuestion = 1
        currentScore = 0
        isShowingScore = false
        imageNumber = Int.random(in: 0...2)
        targetNumber = Int.random(in: 0...1)
    }
}

struct SwiftUIViewMy_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewMy()
    }
}

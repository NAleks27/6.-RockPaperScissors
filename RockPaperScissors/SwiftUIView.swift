//
//  SwiftUIView.swift
//  RockPaperScissors
//
//  Created by Aleksey Nosik on 02.10.2022.
//

import SwiftUI

struct SwiftUIView: View {

    @State private var currentScore = 0
    @State private var currentQuestion = 1
    @State private var neededResult = ["WIN", "LOSE"].randomElement()!
    @State private var computerChoice = ["PAPER", "ROCK", "SCISSORS"].randomElement()
    @State private var isShowingScore = false
    @State private var scoreTitle = ""
    
    let arrayOfImage = ["PAPER", "ROCK", "SCISSORS"]

    var body: some View {
        VStack {
            Color.yellow
                .ignoresSafeArea()
            
            VStack {
                Text("RPS Game")
                    .font(.largeTitle.bold())
                Text("Quest \(currentQuestion)/10")
                Image(arrayOfImage.randomElement()!)
                
                Text(neededResult)
                    .font(.largeTitle.bold())
                    .padding(.bottom, 10)
            }
            .background(.yellow)
            .padding(.top, -20)
            
            HStack {
                ForEach(arrayOfImage, id: \.self) { picture in
                    Button {
                        tapToButton(picture)
                    } label: {
                        Image(picture)
                            .frame(maxWidth: 100, maxHeight: 100)
                            .cornerRadius(10)
                            .shadow(radius: 30)
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
    
    
    func tapToButton(_ playerChoice: String) {
        
        var actualResult: String
        
        switch (computerChoice, playerChoice) {
        case ("ROCK", "SCISSORS"), ("PAPER", "ROCK"), ("SCISSORS", "PAPER"):
            actualResult = "WIN"
        case ("ROCK", "PAPER"), ("PAPER", "SCISSORS"), ("SCISSORS", "ROCK"):
            actualResult = "LOSE"
        default:
            actualResult = "TIE"
        }

        if neededResult == actualResult {
            currentScore += 1
        } else {
            currentScore -= 1
        }
            
        currentQuestion += 1
        
        if currentQuestion > 10 {
            isShowingScore = true
        }
    }
    
    func gameOver() {
        currentQuestion = 1
        currentScore = 0
        isShowingScore = false
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

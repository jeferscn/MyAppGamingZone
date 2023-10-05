//
//  JokenPoGameView.swift
//  MyAppGamingZone
//
//  Created by Jeferson Pereira on 02/10/23.
//

import SwiftUI

enum Choice: String, CaseIterable {
    case rock = "Pedra"
    case paper = "Papel"
    case scissors = "Tesoura"
    
    static func randomChoice() -> Choice {
        let allChoices = Choice.allCases
        let randomIndex = Int.random(in: 0..<allChoices.count)
        return allChoices[randomIndex]
    }
    
    func beats(_ otherChoice: Choice) -> Bool {
        switch (self, otherChoice) {
        case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
            return true
        default:
            return false
        }
    }
}

struct JokenPoGameView: View {
    @State private var playerChoice: Choice?
    @State private var computerChoice: Choice?
    @State private var gameResult: String?
    
    var body: some View {
        VStack {
            Text("Pedra, Papel e Tesoura")
                .font(.largeTitle)
            
            Spacer()
            
            Text("Escolha do jogador:")
                .font(.headline)
            
            HStack {
                ForEach(Choice.allCases, id: \.self) { choice in
                    Button(action: {
                        playerChoice = choice
                        computerChoice = Choice.randomChoice()
                        determineWinner()
                    }) {
                        Text(choice.rawValue)
                            .font(.largeTitle)
                    }
                }
            }
            
            Spacer()
            
            Text("Escolha do computador:")
                .font(.headline)
            
            Text(computerChoice?.rawValue ?? "")
                .font(.largeTitle)
            
            Spacer()
            
            Text(gameResult ?? "")
                .font(.headline)
            
            Spacer()
        }
    }
    
    func determineWinner() {
        guard let playerChoice = playerChoice, let computerChoice = computerChoice else { return }
        
        if playerChoice.beats(computerChoice) {
            gameResult = "Você ganhou!"
        } else if computerChoice.beats(playerChoice) {
            gameResult = "Computador ganhou!"
        } else {
            gameResult = "Empate!"
        }
    }
}


#Preview {
    JokenPoGameView()
}

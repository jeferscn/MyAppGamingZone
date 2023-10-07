//
//  JokenPoGameView.swift
//  MyAppGamingZone
//
//  Created by Jeferson Pereira on 06/10/23.
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
    @State private var resultBackgroundColor: Color? = .black
    @State private var returnToRoom: Bool = false
    
    var body: some View {
        
        if returnToRoom {
            
            GamingRoomView()
            EmptyView()
        } else {
            VStack {
                VStack {
                    Text("Jokenpô")
                        .font(.largeTitle)
                        .padding(.top, 100)
                    
                    Spacer()
                    
                    Text("Computador")
                        .font(.title)
                        .bold()
                        .fontDesign(.rounded)
                    
                    Image(computerChoice?.rawValue.lowercased() ?? "")
                        .resizable()
                        .scaledToFit()
                        .rotationEffect(.degrees(180.0))
                        .frame(minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 100)
                        .padding()
                    
                    Image(playerChoice?.rawValue.lowercased() ?? "")
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 100)
                    
                    Text("Você")
                        .font(.title)
                        .bold()
                        .fontDesign(.rounded)
                    
                    Spacer()
                    
                    
                    Text(gameResult ?? "")
                        .font(.title)
                        .bold()
                        .fontDesign(.rounded)
                    
                    Spacer()
                    
                    Text("Sua Escolha:")
                        .font(.headline)
                }
                
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
                    .padding(.horizontal, 10)
                    .padding(.bottom, 20)
                    
                }
                
                Spacer()
                
                Button("Sair", action: {
                    
                    returnToRoom = true
                })
                .font(.system(size: 30))
                .fontWeight(.bold)
                .fontDesign(.rounded)
                .multilineTextAlignment(.center)
                .padding(20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(resultBackgroundColor?.opacity(0.4))
            .ignoresSafeArea()
        }
    }
    
    func determineWinner() {
        guard let playerChoice = playerChoice, let computerChoice = computerChoice else { return
        }
        
        if playerChoice.beats(computerChoice) {
            resultBackgroundColor = .green
            gameResult = "Você ganhou!"
        } else if computerChoice.beats(playerChoice) {
            resultBackgroundColor = .red
            gameResult = "Computador ganhou!"
        } else {
            resultBackgroundColor = .yellow
            gameResult = "Empate!"
        }
    }
}


#Preview {
    JokenPoGameView()
}

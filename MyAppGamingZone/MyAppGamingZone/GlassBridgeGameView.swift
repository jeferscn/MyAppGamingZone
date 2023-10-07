//
//  GlassBridgeGameView.swift
//  MyAppGamingZone
//
//  Created by Jeferson Pereira on 02/10/23.
//

import SwiftUI

struct GlassBridgeGameView: View {
    
    @State var playerWin = false
    
    @State var stepNumber = 0
    
    @State var gameOver = false
    
    @State var isSelectedButton10 = false
    @State var isSelectedButton11 = false
    @State var isSelectedButton20 = false
    @State var isSelectedButton21 = false
    @State var isSelectedButton30 = false
    @State var isSelectedButton31 = false
    @State var isSelectedButton40 = false
    @State var isSelectedButton41 = false
    @State var isSelectedButton50 = false
    @State var isSelectedButton51 = false
    @State var isSelectedButton60 = false
    @State var isSelectedButton61 = false
    
    @State var button10: Bool = false
    @State var button11: Bool = false
    @State var button20: Bool = false
    @State var button21: Bool = false
    @State var button30: Bool = false
    @State var button31: Bool = false
    @State var button40: Bool = false
    @State var button41: Bool = false
    @State var button50: Bool = false
    @State var button51: Bool = false
    @State var button60: Bool = false
    @State var button61: Bool = false
    
    @State var returnToRoom: Bool = false
    
    var body: some View {
        
        NavigationView {
            if playerWin {
                
                WinnerScreenView()
                EmptyView()
            } else if returnToRoom {
                
                GamingRoomView()
                EmptyView()
            } else {
                
                VStack {
                    Spacer()
                    
                    HStack {
                        showGlassTileGround(selectedButton: isSelectedButton10, buttonNumber: 10, buttonWalkable: button10)
                        
                        showGlassTileGround(selectedButton: isSelectedButton11, buttonNumber: 11, buttonWalkable: button11)
                    }
                    .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 300, alignment: .center)
                    .scaledToFit()
                    
                    HStack {
                        showGlassTileGround(selectedButton: isSelectedButton20, buttonNumber: 20, buttonWalkable: button20)
                        
                        showGlassTileGround(selectedButton: isSelectedButton21, buttonNumber: 21, buttonWalkable: button21)
                    }
                    .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 300, alignment: .center)
                    .scaledToFit()
                    
                    HStack {
                        showGlassTileGround(selectedButton: isSelectedButton30, buttonNumber: 30, buttonWalkable: button30)
                        
                        showGlassTileGround(selectedButton: isSelectedButton31, buttonNumber: 31, buttonWalkable: button31)
                    }
                    .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 300, alignment: .center)
                    .scaledToFit()
                    
                    HStack {
                        showGlassTileGround(selectedButton: isSelectedButton40, buttonNumber: 40, buttonWalkable: button40)
                        
                        showGlassTileGround(selectedButton: isSelectedButton41, buttonNumber: 41, buttonWalkable: button41)
                    }
                    .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 300, alignment: .center)
                    .scaledToFit()
                    
                    HStack {
                        showGlassTileGround(selectedButton: isSelectedButton50, buttonNumber: 50, buttonWalkable: button50)
                        
                        showGlassTileGround(selectedButton: isSelectedButton51, buttonNumber: 51, buttonWalkable: button51)
                    }
                    .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 300, alignment: .center)
                    .scaledToFit()
                    
                    HStack {
                        showGlassTileGround(selectedButton: isSelectedButton60, buttonNumber: 60, buttonWalkable: button60)
                        
                        showGlassTileGround(selectedButton: isSelectedButton61, buttonNumber: 61, buttonWalkable: button61)
                    }
                    .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 300, alignment: .center)
                    .scaledToFit()
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.black)
                .alert(isPresented: $gameOver) {
                    Alert(
                        title: Text("Você perdeu!"),
                        message: Text(""),
                        primaryButton: .default(
                            Text("Tentar novamente"),
                            action: {
                                
                                restartGame()
                            }
                        ),
                        secondaryButton: .cancel(
                            Text("Sair"),
                            action: {
                                
                                returnToRoom = true
                            }
                        )
                    )
                }
                .onAppear {
                    setupStepsGround()
                }
            }
        }
    }
    
    private func verifyStepWinLose(tileGroundPosition: Bool) {
        
        switch tileGroundPosition {
        case true:
            gameOver = false
            stepNumber += 1
        case false:
            gameOver = true
            stepNumber = 0
        }
        
        if !gameOver && stepNumber >= 6 {
            playerWin = true
        }
    }
    
    private func restartGame() {
        gameOver = false
        stepNumber = 0
        playerWin = false
        
        isSelectedButton10 = false
        isSelectedButton11 = false
        isSelectedButton20 = false
        isSelectedButton21 = false
        isSelectedButton30 = false
        isSelectedButton31 = false
        isSelectedButton40 = false
        isSelectedButton41 = false
        isSelectedButton50 = false
        isSelectedButton51 = false
        isSelectedButton60 = false
        isSelectedButton61 = false
    }
    
    private func setupStepsGround() {
        
        let button10 = Bool.random()
        let button11 = !button10
        let button20 = Bool.random()
        let button21 = !button20
        let button30 = Bool.random()
        let button31 = !button30
        let button40 = Bool.random()
        let button41 = !button40
        let button50 = Bool.random()
        let button51 = !button50
        let button60 = Bool.random()
        let button61 = !button60
        
        self.button10 = button10
        self.button11 = button11
        self.button20 = button20
        self.button21 = button21
        self.button30 = button30
        self.button31 = button31
        self.button40 = button40
        self.button41 = button41
        self.button50 = button50
        self.button51 = button51
        self.button60 = button60
        self.button61 = button61
    }
    
    private func showGlassTileGround(selectedButton: Bool, buttonNumber: Int, buttonWalkable: Bool) -> some View {
        
        return Button(action: {
            verifyStepWinLose(tileGroundPosition: buttonWalkable)
            
            switch buttonNumber {
            case 10: isSelectedButton10 = true
            case 11: isSelectedButton11 = true
            case 20: isSelectedButton20 = true
            case 21: isSelectedButton21 = true
            case 30: isSelectedButton30 = true
            case 31: isSelectedButton31 = true
            case 40: isSelectedButton40 = true
            case 41: isSelectedButton41 = true
            case 50: isSelectedButton50 = true
            case 51: isSelectedButton51 = true
            case 60: isSelectedButton60 = true
            case 61: isSelectedButton61 = true
            default: break
            }
        }) {
            ZStack {
                
                showGlassTile()
                
                if selectedButton && !gameOver {
                    showShoePrint()
                }
            }
        }
        .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
        .scaledToFit()
        .disabled(selectedButton)
    }
    
    private func showGlassTile() -> some View {
        
        return Image("GlassOfBridge")
            .resizable()
            .scaledToFit()
            .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
    }
    
    private func showShoePrint() -> some View {
        
        return Image(systemName: "shoeprints.fill")
            .font(.system(size: 100))
            .foregroundColor(.green)
    }
}

#Preview {
    GlassBridgeGameView()
}

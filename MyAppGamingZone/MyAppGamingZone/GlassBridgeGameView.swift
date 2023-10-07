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
                    // ------- Line 1 --------
                    HStack {
                        //-----------Left Button Line 1---------------
                        Button(action: {
                            verifyStepWinLose(tileGroundPosition: button10)
                            isSelectedButton10 = true
                        }) {
                            Image("GlassOfBridge")
                                .resizable()
                                .scaledToFit()
                                .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                                .background(isSelectedButton10 && !gameOver ? Color.green : Color.black.opacity(0.10))
                            
                            
                        }
                        .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                        .scaledToFit()
                        .disabled(isSelectedButton10)
                        //-----------Left Button Line 1---------------
                        
                        //-----------Right Button Line 1---------------
                        Button(action: {
                            verifyStepWinLose(tileGroundPosition: button11)
                            isSelectedButton11 = true
                        }) {
                            Image("GlassOfBridge")
                                .resizable()
                                .scaledToFit()
                                .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                                .background(isSelectedButton11 && !gameOver ? Color.green : Color.black.opacity(0.10))
                            
                        }
                        .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                        .scaledToFit()
                        .disabled(isSelectedButton11)
                        //-----------Right Button Line 1---------------
                    }
                    .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 300, alignment: .center)
                    .scaledToFit()
                    // ------- End Line 1 --------
                    
                    // ------- Line 2 --------
                    HStack {
                        //-----------Left Button Line 2---------------
                        Button(action: {
                            verifyStepWinLose(tileGroundPosition: button20)
                            isSelectedButton20 = true
                        }) {
                            Image("GlassOfBridge")
                                .resizable()
                                .scaledToFit()
                                .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                                .background(isSelectedButton20 && !gameOver ? Color.green : Color.black.opacity(0.10))
                            
                            
                        }
                        .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                        .scaledToFit()
                        .disabled(isSelectedButton20)
                        //-----------Left Button Line 2---------------
                        
                        //-----------Right Button Line 2---------------
                        Button(action: {
                            verifyStepWinLose(tileGroundPosition: button21)
                            isSelectedButton21 = true
                        }) {
                            Image("GlassOfBridge")
                                .resizable()
                                .scaledToFit()
                                .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                                .background(isSelectedButton21 && !gameOver ? Color.green : Color.black.opacity(0.10))
                            
                        }
                        .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                        .scaledToFit()
                        .disabled(isSelectedButton21)
                        //-----------Right Button Line 2---------------
                    }
                    .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 300, alignment: .center)
                    .scaledToFit()
                    // ------- End Line 2 --------
                    
                    // ------- Line 3 --------
                    HStack {
                        //-----------Left Button Line 3---------------
                        Button(action: {
                            verifyStepWinLose(tileGroundPosition: button30)
                            isSelectedButton30 = true
                        }) {
                            Image("GlassOfBridge")
                                .resizable()
                                .scaledToFit()
                                .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                                .background(isSelectedButton30 && !gameOver ? Color.green : Color.black.opacity(0.10))
                            
                            
                        }
                        .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                        .scaledToFit()
                        .disabled(isSelectedButton30)
                        //-----------Left Button Line 3---------------
                        
                        //-----------Right Button Line 3---------------
                        Button(action: {
                            verifyStepWinLose(tileGroundPosition: button31)
                            isSelectedButton31 = true
                        }) {
                            Image("GlassOfBridge")
                                .resizable()
                                .scaledToFit()
                                .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                                .background(isSelectedButton31 && !gameOver ? Color.green : Color.black.opacity(0.10))
                            
                        }
                        .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                        .scaledToFit()
                        .disabled(isSelectedButton31)
                        //-----------Right Button Line 3---------------
                    }
                    .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 300, alignment: .center)
                    .scaledToFit()
                    // ------- End Line 3 --------
                    
                    // ------- Line 4 --------
                    HStack {
                        //-----------Left Button Line 4---------------
                        Button(action: {
                            verifyStepWinLose(tileGroundPosition: button40)
                            isSelectedButton40 = true
                        }) {
                            Image("GlassOfBridge")
                                .resizable()
                                .scaledToFit()
                                .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                                .background(isSelectedButton40 && !gameOver ? Color.green : Color.black.opacity(0.10))
                            
                            
                        }
                        .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                        .scaledToFit()
                        .disabled(isSelectedButton40)
                        //-----------Left Button Line 4---------------
                        
                        //-----------Right Button Line 4---------------
                        Button(action: {
                            verifyStepWinLose(tileGroundPosition: button41)
                            isSelectedButton41 = true
                        }) {
                            Image("GlassOfBridge")
                                .resizable()
                                .scaledToFit()
                                .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                                .background(isSelectedButton41 && !gameOver ? Color.green : Color.black.opacity(0.10))
                            
                        }
                        .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                        .scaledToFit()
                        .disabled(isSelectedButton41)
                        //-----------Right Button Line 4---------------
                    }
                    .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 300, alignment: .center)
                    .scaledToFit()
                    // ------- End Line 4 --------
                    
                    // ------- Line 5 --------
                    HStack {
                        //-----------Left Button Line 5---------------
                        Button(action: {
                            verifyStepWinLose(tileGroundPosition: button50)
                            isSelectedButton50 = true
                        }) {
                            Image("GlassOfBridge")
                                .resizable()
                                .scaledToFit()
                                .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                                .background(isSelectedButton50 && !gameOver ? Color.green : Color.black.opacity(0.10))
                            
                            
                        }
                        .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                        .scaledToFit()
                        .disabled(isSelectedButton50)
                        //-----------Left Button Line 5---------------
                        
                        //-----------Right Button Line 5---------------
                        Button(action: {
                            verifyStepWinLose(tileGroundPosition: button51)
                            isSelectedButton51 = true
                        }) {
                            Image("GlassOfBridge")
                                .resizable()
                                .scaledToFit()
                                .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                                .background(isSelectedButton51 && !gameOver ? Color.green : Color.black.opacity(0.10))
                            
                        }
                        .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                        .scaledToFit()
                        .disabled(isSelectedButton51)
                        //-----------Right Button Line 5---------------
                    }
                    .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 300, alignment: .center)
                    .scaledToFit()
                    // ------- End Line 5 --------
                    
                    // ------- Line 6 --------
                    HStack {
                        //-----------Left Button Line 6---------------
                        Button(action: {
                            verifyStepWinLose(tileGroundPosition: button60)
                            isSelectedButton60 = true
                        }) {
                            Image("GlassOfBridge")
                                .resizable()
                                .scaledToFit()
                                .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                                .background(isSelectedButton60 && !gameOver ? Color.green : Color.black.opacity(0.10))
                            
                            
                        }
                        .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                        .scaledToFit()
                        .disabled(isSelectedButton60)
                        //-----------Left Button Line 6---------------
                        
                        //-----------Right Button Line 6---------------
                        Button(action: {
                            verifyStepWinLose(tileGroundPosition: button61)
                            isSelectedButton61 = true
                        }) {
                            Image("GlassOfBridge")
                                .resizable()
                                .scaledToFit()
                                .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                                .background(isSelectedButton61 && !gameOver ? Color.green : Color.black.opacity(0.10))
                            
                        }
                        .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300)
                        .scaledToFit()
                        .disabled(isSelectedButton61)
                        //-----------Right Button Line 6---------------
                    }
                    .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 300, alignment: .center)
                    .scaledToFit()
                    // ------- End Line 6 --------
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
            }
        }
    }
    
    func verifyStepWinLose(tileGroundPosition: Bool) {
        
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
    
    func restartGame() {
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
}

#Preview {
    GlassBridgeGameView()
}

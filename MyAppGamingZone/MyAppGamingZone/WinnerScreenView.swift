//
//  WinnerScreenView.swift
//  MyAppGamingZone
//
//  Created by Jeferson Pereira on 06/10/23.
//

import SwiftUI

struct WinnerScreenView: View {
    
    @State var returnToRoom = false
    @State var returnToGame = false
    
    var body: some View {
        
        NavigationView {
            if returnToRoom {
                
                GamingRoomView()
                EmptyView()
            } else if returnToGame {
                
                GlassBridgeGameView()
                EmptyView()
            } else {
                
                VStack {
                    
                    Spacer()
                    
                    Image(systemName: "trophy.circle")
                        .foregroundColor(.white)
                        .font(.system(size: 150))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .fontDesign(.rounded)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("Parábens! \nVocê venceu!")
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .fontDesign(.rounded)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Spacer()
                    
                    HStack {
                        Button("Reiniciar", action: {
                            
                            returnToGame = true
                        })
                        .font(.system(size: 30))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .fontDesign(.rounded)
                        .multilineTextAlignment(.center)
                        
                        Spacer()
                        
                        Button("Sair", action: {
                            
                            returnToRoom = true
                        })
                        .font(.system(size: 30))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .fontDesign(.rounded)
                        .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal, 50)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity,  alignment: .center)
                .background(Color.black)
            }
        }
    }
}

#Preview {
    WinnerScreenView()
}

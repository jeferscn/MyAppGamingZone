//
//  GamingRoomView.swift
//  MyAppGamingZone
//
//  Created by Jeferson Pereira on 30/09/23.
//

import SwiftUI

struct GamingRoomView: View {
    @State var callGlassBridgeGameView = false
    @State var callJokenPoGameView = false
    
    var body: some View {
        
        NavigationView {
            if callJokenPoGameView {
                
                JokenPoGameView()
                EmptyView()
            } else if callGlassBridgeGameView {
                
                GlassBridgeGameView()
                EmptyView()
            } else {
                
                ScrollView {
                    Text("Bem vindo à sala de jogos!")
                        .font(.title2)
                        .bold()
                        .fontDesign(.rounded)
                    VStack {
                        Button {
                            callGlassBridgeGameView = true
                        } label: {
                            
                            Image("RoundSixty")
                                .resizable()
                                .scaledToFit()
                            
                            Text("Ponte de Vidro")
                                .font(.title)
                                .bold()
                                .fontDesign(.rounded)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 180, alignment: .leading)
                        .background(Color.black)
                        .cornerRadius(15)
                        
                        Button {
                            callJokenPoGameView = true
                        } label: {
                            
                            Image("Jokenpo")
                                .resizable()
                                .scaledToFit()
                            
                            Text("JokenPo")
                                .font(.title)
                                .bold()
                                .fontDesign(.rounded)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 180, alignment: .leading)
                        .background(Color.black)
                        .cornerRadius(15)
                    }
                    .padding(5)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.gray)
            }
        }
    }
}


#Preview {
    GamingRoomView()
}

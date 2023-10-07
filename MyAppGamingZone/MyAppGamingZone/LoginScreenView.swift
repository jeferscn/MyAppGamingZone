//
//  LoginScreenView.swift
//  MyAppGamingZone
//
//  Created by Jeferson Pereira on 30/09/23.
//

import SwiftUI

struct LoginScreenView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.userAccount, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State private var accountName = ""
    @State private var accountPassword = ""
    @State private var isLoggedIn = false
    @State private var showSuccessErrorAlert = false
    
    var body: some View {
        NavigationView {
            if isLoggedIn {
                GamingRoomView()
                EmptyView()
            } else {
                VStack {
                    Image(systemName: "gamecontroller.fill")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .font(.system(size: 50))
                    
                    Text("GamingZone")
                        .font(.system(size: 50, weight: .regular, design: .default))
                    
                    VStack {
                        
                        Text("Fazer login")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .frame(maxWidth:.infinity, alignment: .center)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text("Email:")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .frame(maxWidth:.infinity, alignment: .leading)
                            .foregroundColor(.white)
                        
                        TextField(
                            "Enter email",
                            text: $accountName
                        )
                        .modifier(TextFieldDefault())
                        .padding(.bottom, 20)
                        .keyboardType(.emailAddress)
                        
                        Text("Senha:")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .frame(maxWidth:.infinity, alignment: .leading)
                            .foregroundColor(.white)
                        
                        SecureField("Enter password", text: $accountPassword)
                            .modifier(TextFieldDefault())
                        
                        Button {
                            isValidLogin()
                        } label: {
                            Text("Entrar")
                                .padding(.vertical, 30)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Image(systemName: "play.fill")
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                                .font(.system(size: 20))
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        NavigationLink(_: "Criar uma conta", destination: CreateAccountView())
                    }
                    .frame(maxWidth: .infinity, maxHeight: 400, alignment: .bottom)
                    .padding(.top, 15)
                    .padding(.horizontal, 10)
                    .background(.black)
                    .cornerRadius(50, antialiased: true)
                    
                }
                .alert(isPresented: $showSuccessErrorAlert) {
                    
                    Alert(
                        title: Text(isLoggedIn ? "Sucesso ao logar" : "Erro ao logar"),
                        message: Text(isLoggedIn ? "Seja bem-vindo!" : "Verifique email e/ou senha!"),
                        dismissButton: .default(
                            Text("OK")
                        )
                    )
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(0)
                .background(
                    LinearGradient(colors: [.white, .white, .black],
                                   startPoint: .top,
                                   endPoint: .bottom
                                  )
                )
            }
        }
    }
    
    func isValidLogin() {
        if self.accountName != "" && self.accountPassword != "" {
            
            var accounts: [String: String] = [:]
            
            for user in items {
                if let userAccount = user.userAccount {
                    let jsonDictionary = stringToJson(jsonString: userAccount)
                    
                    accounts.merge(jsonDictionary) { (current, _) in current }
                }
            }
            
            for (key, value) in accounts {
                if key == self.accountName && value == self.accountPassword {
                    isLoggedIn = true
                    break
                } else {
                    isLoggedIn = false
                }
            }
            
            showSuccessErrorAlert = true
        } else {
            showSuccessErrorAlert = true
        }
    }
    
    func stringToJson(jsonString: String) -> [String: String] {
        do {
            let jsonData = jsonString.data(using: .utf8)
            let jsonObject = try? JSONSerialization.jsonObject(
                with: jsonData!, options: []
            ) as? [String: String]
            return jsonObject!
        }
    }
    
    struct CustomNavigationLinkLabel: View {
        
        var body: some View {
            HStack {
                Text("Entrar")
                    .padding(.vertical, 30)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Image(systemName: "play.fill")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .font(.system(size: 20))
            }
            .frame(width: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    LoginScreenView()
}

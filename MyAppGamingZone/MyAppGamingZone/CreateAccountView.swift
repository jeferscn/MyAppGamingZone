//
//  CreateAccountView.swift
//  MyAppGamingZone
//
//  Created by Jeferson Pereira on 30/09/23.
//

import SwiftUI
import CoreData

struct CreateAccountView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.userAccount, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State private var accounts: [String: String] = [:]
    @State private var accountName = ""
    @State private var accountPassword = ""
    @State private var isPasswordVisible = false
    @State private var isShowingSuccessMessage = false
    @State private var isShowingErrorMessage = false

    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Text("Criar conta")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .frame(maxWidth:.infinity, alignment: .center)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("Email:")
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .foregroundColor(.white)
                
                TextField("Enter email", text: $accountName)
                    .modifier(TextFieldDefault())
                    .padding(.bottom, 20)
                
                Text("Senha:")
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .foregroundColor(.white)
                
                ZStack {
                    
                    if isPasswordVisible && accountPassword != "" {
                        TextField("Enter password", text: $accountPassword)
                            .modifier(TextFieldDefault())
                    } else {
                        SecureField("Enter password", text: $accountPassword)
                            .modifier(TextFieldDefault())
                    }
                    
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(.blue)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
                }
                
                if isShowingErrorMessage {
                    Text("Todos os campos são obrigatórios.")
                        .foregroundColor(.red)
                        .padding()
                }
                
                Button {
                    
                    if areValidFields() {
                        
                        accounts["\(accountName)"] = "\(accountPassword)"
                        
                        isShowingSuccessMessage = true
                        
                        saveUser()
                        
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        
                        isShowingErrorMessage = true
                    }
                } label: {
                    Text("Criar")
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
            }
            .padding()
            .background(.black)
        }
        .alert(isPresented: $isShowingSuccessMessage) {
            Alert(
                title: Text("Sucesso"),
                message: Text("Conta criada com sucesso!"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    func areValidFields() -> Bool {
        if accountName != "" && accountPassword != "" {
            return true
        } else {
            return false
        }
    }
    
    func saveUser() {
        let newUserData = Item(context: self.viewContext)
        newUserData.userAccount = dictionaryToJsonString(accounts: accounts)
        
        print(dictionaryToJsonString(accounts: accounts))
        try? self.viewContext.save()
    }
    
    func dictionaryToJsonString(accounts: [String : String]) -> String {
        do {
            let jsonData = try? JSONSerialization.data(withJSONObject: accounts, options: [])
            return String(data: jsonData!, encoding: .utf8)!
        }
    }
}

#Preview {
    CreateAccountView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

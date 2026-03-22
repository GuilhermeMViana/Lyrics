//
//  LoginView.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 19/03/26.
//

import SwiftUI
import SwiftData

struct LoginView: View {
    @Query var users: [User]
    
    @State private var username = ""
    @State private var password = ""
    @State private var foundUser: Bool = false
    
    @Query var user: [User]
    
    var body: some View {
            NavigationStack {
                ZStack {
                    Color.background
                        .ignoresSafeArea()
                    
                VStack() {
                    if foundUser == true {
                        Text("Você está logado")
                    }
                    Image("MusicImage")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    VStack {
                        LyricsField(placeholder: "Login", text: $username).textInputAutocapitalization(.never)
                        LyricsField(placeholder: "Senha", text: $password, isSecure: true)
                        
                    }
                    .tint(.accent)
                    
                    LyricsButton(title: "Entrar", action: {
                        foundUser = user.contains(where: { user in
                            return user.email == self.username && user.password == self.password
                        })
                    })
                    
                    NavigationLink {
                        RegisterView()
                    } label: {
                        Text("Registrar")
                    }
                    .buttonStyle(LyricsButtonStyle(variant: .secondary))
                }
            }
        }
    }
}

#Preview {
    LoginView()
}

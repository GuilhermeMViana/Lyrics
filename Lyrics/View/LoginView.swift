//
//  LoginView.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 19/03/26.
//

import SwiftUI
import SwiftData

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var foundUser: Bool = false
    @State private var loginError: Bool = false
    
    @Query var user: [User]
    
    var body: some View {
        NavigationStack {
            if foundUser {
                HomeView()
            } else {
                ZStack {
                    Color.background
                        .ignoresSafeArea()
                    
                    VStack() {
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
                            
                            if !foundUser {
                                loginError = true
                            }
                        })
                        
                        NavigationLink {
                            RegisterView()
                        } label: {
                            Text("Registrar")
                        }
                        .buttonStyle(LyricsButtonStyle(variant: .secondary))
                    }
                }
                .alert("Erro de autenticação", isPresented: $loginError) {
                    Button("OK", role: .cancel) {}
                } message: {
                    Text("Usuário ou senha inválidos. Por favor, tente novamente.")
                }
            }
        }
    }
}

#Preview {
    LoginView()
}

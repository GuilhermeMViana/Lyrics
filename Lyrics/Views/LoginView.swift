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
    
    var body: some View {
            NavigationStack {
                ZStack {
                    Color.background
                        .ignoresSafeArea()
                    
                VStack() {
                    Image("MusicImage")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    VStack {
                        LyricsField(placeholder: "Login", text: $username)
                        LyricsField(placeholder: "Senha", text: $password, isSecure: true)
                        
                    }
                    .tint(.accent)
                    
                    LyricsButton(title: "Entrar", action: {})
                    
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

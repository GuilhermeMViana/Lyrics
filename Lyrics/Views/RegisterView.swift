//
//  RegisterView.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 19/03/26.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            VStack {
                LyricsField(placeholder: "Nome", text: $name)
                
                LyricsField(placeholder: "E-mail", text: $email)
                
                LyricsField(placeholder: "Telefone", text: $phone)
                
                LyricsField(placeholder: "Senha", text: $password , isSecure: true)
                
                LyricsField(placeholder: "Confirmar Senha", text: $confirmPassword , isSecure: true)
                
                LyricsButton(title: "Cadastrar", action: {},  variant: .secondary)

            }
            .padding()
        }
    }
}

#Preview {
    RegisterView()
}

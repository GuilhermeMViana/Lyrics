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
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack {
            TextField("Nome", text: $name)
                .padding()
            
            TextField("E-mail", text: $username)
                .padding()
            
            TextField("Telefone", text: $username)
                .padding()
            
            TextField("Login", text: $username)
                .padding()
                
            
            SecureField("Senha", text: $password)
                .padding()
            
            SecureField("Confirmar Senha", text: $confirmPassword)
                .padding()
            
            Button("Registrar") {
                
            }
            .buttonStyle(.glassProminent)

        }
        .padding()
    }
}

#Preview {
    RegisterView()
}

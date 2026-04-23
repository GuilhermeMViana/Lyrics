//
//  RegisterView.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 19/03/26.
//

import SwiftUI
import SwiftData
import PhoneNumberKit

struct RegisterView: View {
    @Environment(\.modelContext) var modelContext
    @State private var viewModel = RegisterViewModel()
    @State private var didRegister = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                VStack {
                    NavigationLink(destination: LoginView(), isActive: $didRegister) {
                        EmptyView()
                    }
                    .hidden()
                    
                    Text("Digite seus dados:")
                        .font(Font.largeTitle.bold())
                        .foregroundStyle(Color.primaryText)
                    
                    LyricsField(placeholder: "Nome", text: $viewModel.name)
                    
                    LyricsField(placeholder: "E-mail", text: $viewModel.email).textInputAutocapitalization(.never)
                    
                    LyricsPhoneField(placeholder: "Telefone", text: $viewModel.phone)
                        .keyboardType(.phonePad)
                        .frame(height: 22)
                        .lyricsFieldStyle()
                    
                    LyricsField(placeholder: "Senha", text: $viewModel.password , isSecure: true)
                    
                    LyricsField(placeholder: "Confirmar Senha", text: $viewModel.confirmPassword , isSecure: true)
                    
                    LyricsButton(title: "Cadastrar", variant: .secondary, action: {
                        if viewModel.isFormValid {
                            viewModel.register(context: modelContext)
                            didRegister = true
                            print("Usuário Salvo")
                        } else {
                            print("Erro")
                        }
                    })
                    
                    NavigationLink {
                        LoginView()
                    } label: {
                        Text("Voltar para tela de login")
                    }

                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    RegisterView()
}


//
//  RegisterViewModel.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 21/03/26.
//

import Foundation
import SwiftData
import Combine

class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var phone = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    var passwordsMatch: Bool {
        password == confirmPassword
    }
    
    var isFormValid: Bool {
        !name.isEmpty && !email.isEmpty && !phone.isEmpty && !password.isEmpty && !confirmPassword.isEmpty && passwordsMatch
    }
    
    func register(context: ModelContext) {
        let newUser = User(
            name: name,
            email: email,
            phone: phone,
            password: password
        )
        context.insert(newUser)
        
        
    }
}

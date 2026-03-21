//
//  LyricsField.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 19/03/26.
//

import SwiftUI

struct LyricsField: View {
    
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        
        if isSecure {
            SecureField(text: $text){
                Text(placeholder)
                    .foregroundStyle(Color.secondaryText)
            }
            .lyricsFieldStyle()
        } else {
            TextField(text: $text){
                Text(placeholder)
                    .foregroundStyle(Color.secondaryText)
            }
            .lyricsFieldStyle()
        }
        
    }
}

#Preview {
    VStack(spacing: 20){
        LyricsField(placeholder: "Login", text: .constant(""))
        LyricsField(placeholder: "Senha", text: .constant(""))
    }
    .padding()
    .background(Color.background)
}

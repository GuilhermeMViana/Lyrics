//
//  LyricsField.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 19/03/26.
//

import SwiftUI

struct LyricsField: View {
    
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        
        if isSecure {
            SecureField(text: $text){
                Text(placeholder)
                    .foregroundStyle(Color.secondaryText)
            }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.accent, lineWidth: 2)
                )
                .padding()
        } else {
            TextField(text: $text){
                Text(placeholder)
                    .foregroundStyle(Color.secondaryText)
            }
                .foregroundStyle(Color.primaryText)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.accent, lineWidth: 2)
                )
                .padding()
        }
        
    }
}

#Preview {
    LyricsField(placeholder: "", text: .constant(""))
}

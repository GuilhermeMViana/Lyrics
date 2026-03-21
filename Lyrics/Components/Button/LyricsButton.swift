//
//  LyricsButton.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 20/03/26.
//

import SwiftUI

struct LyricsButton: View {
    let title: String
    var variant: ButtonVariants = .primary
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
        }
        .buttonStyle(LyricsButtonStyle(variant: variant))
    }
    
    
}


#Preview {
    VStack(spacing: 20) {
        LyricsButton(title: "Ouvir Agora", variant: .primary, action: {})
        LyricsButton(title: "Adicionar à Playlist", variant: .secondary, action: {})
        LyricsButton( title: "Remover", variant: .alert, action: {})
    }
    .padding()
    .background(Color.background)
}


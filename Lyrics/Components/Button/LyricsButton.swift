//
//  LyricsButton.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 20/03/26.
//

import SwiftUI

struct LyricsButton: View {
    let title: String
    let action: () -> Void
    var variant: ButtonVariants = .primary
    
    var body: some View {
        Button(action: action) {
            Text(title)
        }
        .buttonStyle(LyricsButtonStyle(variant: variant))
    }
    
    
}


#Preview {
    VStack(spacing: 20) {
        LyricsButton(title: "Ouvir Agora", action: {},  variant: .primary)
        LyricsButton(title: "Adicionar à Playlist",action: {},  variant: .secondary)
        LyricsButton( title: "Remover",action: {}, variant: .alert)
    }
    .padding()
    .background(Color.background)
}


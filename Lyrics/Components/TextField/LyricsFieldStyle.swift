//
//  LyricsFieldStyle.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 21/03/26.
//

import SwiftUI

struct LyricsFieldStyle: ViewModifier {
    let borderColor: Color = .accent
    
    func body(content: Content) -> some View {
        content
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(borderColor, lineWidth: 2)
            )
            .padding()
            .tint(.accent)
    }
}

extension View {
    func lyricsFieldStyle() -> some View {
        modifier(LyricsFieldStyle())
    }
}

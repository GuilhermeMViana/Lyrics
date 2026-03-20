//
//  LyricsButtonStyle.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 20/03/26.
//

import SwiftUI

struct LyricsButtonStyle: ButtonStyle {
    let variant: ButtonVariants
    
    func makeBody(configuration: Configuration)-> some View {
        configuration.label
            .font(.headline)
            .padding(.vertical, 14)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(borderColor, lineWidth: variant == .secondary ? 2 : 0)
            )
            .cornerRadius(5)
            .padding()
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
    
    private var backgroundColor: Color {
        switch variant {
        case .primary: return Color.accent
        case .secondary:  return Color.clear
        case .alert: return Color.alert
        }
    }
    
    private var foregroundColor: Color {
        switch variant {
        case .primary, .alert: return Color.primaryText
        case .secondary: return Color.secondaryText
        }
    }
    
    private var borderColor: Color {
        variant == .secondary ? Color.secondaryText : Color.clear
    }
}

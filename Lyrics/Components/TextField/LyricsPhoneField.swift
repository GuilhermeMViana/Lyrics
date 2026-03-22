//
//  LyricsPhoneField.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 21/03/26.
//

import SwiftUI
import PhoneNumberKit

struct LyricsPhoneField: UIViewRepresentable {
    var placeholder: String
    @Binding var text: String
    
    func makeUIView(context: Context) -> PhoneNumberTextField {
        let textField = PhoneNumberTextField()
        textField.withPrefix = true
        textField.withFlag = true
        textField.withDefaultPickerUI = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = placeholder
        textField.backgroundColor = .clear
        textField.textColor = UIColor(.primaryText)
        textField.addTarget(
            context.coordinator,
            action: #selector(Coordinator.textDidChange(_:)),
            for: .editingChanged
        )
        return textField
    }
    
    func updateUIView(_ uiView: PhoneNumberTextField, context: Context) {
        if uiView.text != text {
            uiView.text = text
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: LyricsPhoneField
        
        init(_ parent: LyricsPhoneField) {
            self.parent = parent
        }
        
        @objc func textDidChange(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }
    }
}

#Preview {
    LyricsPhoneField(placeholder: "Telefone", text: .constant(""))
        .lyricsFieldStyle()
}

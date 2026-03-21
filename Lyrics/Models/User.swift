//
//  Item.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 19/03/26.
//

import Foundation
import SwiftData

@Model
final class User {
    @Attribute(.unique) var id: UUID
    var name: String
    var email: String
    var phone: String
    var password: String
    var createdAt: Date
    
    init(id: UUID = UUID(), name: String, email: String, phone: String, password: String, createdAt: Date = .now) {
        self.id = id
        self.name = name
        self.email = email
        self.phone = phone
        self.password = password
        self.createdAt = createdAt
    }
}

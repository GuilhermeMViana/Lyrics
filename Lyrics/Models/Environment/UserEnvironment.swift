//
//  UserEnvironment.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 27/04/26.
//

import SwiftUI
import SwiftData

@Observable
class UserEnvironment {
    var currentUser: User?

    init(modelContext: ModelContext) {
        fetchUser(modelContext: modelContext)
    }

    private func fetchUser(modelContext: ModelContext) {
        let descriptor = FetchDescriptor<User>()
        currentUser = try? modelContext.fetch(descriptor).first
    }
}

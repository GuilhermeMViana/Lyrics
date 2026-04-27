//
//  LyricsLisItemViewModel.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 24/04/26.
//

import Foundation
import SwiftData
import SwiftUI

@Observable
class LyricsLisItemViewModel {
    private var userEnv: UserEnvironment
    private var modelContext: ModelContext
    var item: Music
    
    init(modelContext: ModelContext, item: Music, userEnv: UserEnvironment) {
        self.modelContext = modelContext
        self.item = item
        self.userEnv = userEnv
    }
    
    var isFavorited: Bool {
        userEnv.currentUser?.favoritedSongs.contains(where: { $0.trackId == item.trackId }) ?? false
    }
    
    func toggleFavorite() {
        guard let user = userEnv.currentUser else { return }
        if isFavorited {
            user.favoritedSongs.removeAll(where: { $0.trackId == item.trackId })
        } else {
            user.favoritedSongs.append(item)
        }
        try? modelContext.save()
    }
}

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
    private var modelContext: ModelContext
    var item: Music
    var user: User?
    
    init(modelContext: ModelContext, item: Music, user: User?) {
        self.modelContext = modelContext
        self.item = item
        self.user = user
    }
    
    var isFavorited: Bool {
        user?.favoritedSongs.contains(where: { $0.id == item.id }) ?? false
    }
    
    func toggleFavorite() {
        guard let user = user else { return }
        if isFavorited {
            user.favoritedSongs.removeAll(where: { $0.trackId == item.trackId })
        } else {
            user.favoritedSongs.append(item)
        }
        
        try? modelContext.save()
    }
}

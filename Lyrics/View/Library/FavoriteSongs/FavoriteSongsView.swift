//
//  FavouriteSongsView.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 23/04/26.
//

import SwiftUI

struct FavoriteSongsView: View {
    @Environment(UserEnvironment.self) private var userEnv
    
    var body: some View {
        List {
            if let songs = userEnv.currentUser?.favoritedSongs, !songs.isEmpty {
                ForEach(songs, id: \.trackId) { music in
                    LyricsListItemView(item: music)
                }
            }
        }
        .navigationTitle("Músicas Favoritas")
    }
}

#Preview {
    FavoriteSongsView()
}

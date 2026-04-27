//
//  HomeView.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 23/04/26.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    var body: some View {
        TabView {
            SongsListView()
                .tabItem { Label("Músicas", systemImage: "music.note") }

            FavoriteSongsView()
                .tabItem { Label("Favoritos", systemImage: "star") }
        }
    }
}

#Preview {
    HomeView()
}

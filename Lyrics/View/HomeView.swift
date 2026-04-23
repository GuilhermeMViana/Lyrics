//
//  HomeView.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 23/04/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            SongsList()
                .tabItem {
                    Label("Músicas", systemImage: "music.note")
                }
            
            FavoriteSongs()
                .tabItem {
                    Label("Favoritos", systemImage: "star")
                }
        }
    }
}

#Preview {
    HomeView()
}

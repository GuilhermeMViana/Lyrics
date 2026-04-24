//
//  LyricsListItem.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 23/04/26.
//

import SwiftUI
import SwiftData

struct LyricsListItem: View {
    @Environment(\.modelContext) var modelContext
    
    let item: Music
    

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.artistName)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Button("") {
                modelContext.insert(item)
            }
            .padding()
            .background {
                Image(systemName: "heart")
            }
        }
    }
}

#Preview {
    LyricsListItem(item: Music(
        trackId: 1,
        artistName: "Eminem",
        trackName: "Lose Yourself",
        collectionName: "8 Mile"
    ))
}

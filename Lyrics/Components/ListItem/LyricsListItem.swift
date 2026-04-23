//
//  LyricsListItem.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 23/04/26.
//

import SwiftUI

struct LyricsListItem: View {
    let item: Result

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
                
            }
            .padding()
            .background {
                Image(systemName: "heart")
            }
        }
    }
}

#Preview {
    LyricsListItem(item: Result(
        trackId: 1,
        artistName: "Eminem",
        trackName: "Lose Yourself"
    ))
}

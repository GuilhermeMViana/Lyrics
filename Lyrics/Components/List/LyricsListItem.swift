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
    let user: User?

    var body: some View {
        let viewModel = LyricsLisItemViewModel(modelContext: modelContext, item: item, user: user)
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.item.trackName)
                    .font(.headline)
                Text(viewModel.item.artistName)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Button {
                viewModel.toggleFavorite()
                print(viewModel.isFavorited ? "Sim" : "Não")
            } label: {
                Image(systemName: viewModel.isFavorited ? "heart.fill" : "heart")
                    .foregroundColor(viewModel.isFavorited ? .red : .gray)
                    .font(.system(size: 25))
                    .padding(10)
            }
            .buttonStyle(.borderless)
            }
    }
}

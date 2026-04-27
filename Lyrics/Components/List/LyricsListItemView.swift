//
//  LyricsListItem.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 23/04/26.
//

import SwiftUI
import SwiftData

struct LyricsListItemView: View {
    @Environment(UserEnvironment.self) private var userEnv
    @Environment(\.modelContext) var modelContext
    @State private var viewModel: LyricsLisItemViewModel?
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
            
            Button {
                viewModel?.toggleFavorite()
            } label: {
                Image(systemName: viewModel?.isFavorited == true ? "heart.fill" : "heart")
                    .foregroundColor(viewModel?.isFavorited == true ? .red : .gray)
                    .font(.system(size: 25))
                    .padding(10)
            }
            .buttonStyle(.borderless)
        }
        .task {
            if viewModel == nil {
                viewModel = LyricsLisItemViewModel(modelContext: modelContext, item: item, userEnv: userEnv)
            }
        }
    }
}

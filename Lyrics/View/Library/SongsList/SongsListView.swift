//
//  SongsList.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 23/04/26.
//

import SwiftUI

struct SongsListView: View {
    @StateObject private var viewModel = SongsListViewModel()
    
    
    var body: some View {
        NavigationStack {
            List(viewModel.results, id: \.trackId) { item in
                VStack(alignment: .leading) {
                    LyricsListItemView(item: item)
                }
            }
            .selectionDisabled()
            .task {
                await viewModel.loadData()
            }
        }
        .safeAreaInset(edge: .bottom) {
            HStack {
                Spacer(minLength: 16)
                TextField("Pesquisar", text: $viewModel.search)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(.white)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .strokeBorder(Color.secondary.opacity(0.15), lineWidth: 1)
                    )
                    .onChange(of: viewModel.search) { _, newValue in
                        viewModel.updateSearch(newValue)
                    }
                Spacer(minLength: 16)
            }
        }
    }
}



#Preview {
    SongsListView()
}

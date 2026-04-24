//
//  SongsList.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 23/04/26.
//

import SwiftUI

struct SongsListView: View {
    @StateObject private var viewModel = SongsListViewModel()
    let currentUser: User?
    
    
    var body: some View {
        NavigationStack {
            Text(currentUser?.name ?? "")
            List(viewModel.results, id: \.trackId) { item in
                VStack(alignment: .leading) {
                    LyricsListItem(item: item, user: currentUser)
                }
            }
            .selectionDisabled()
            .task {
                await viewModel.loadData()
            }
        }
        .searchable(text: $viewModel.search)
        .onChange(of: viewModel.search) { _, newValue in
            viewModel.updateSearch(newValue)
        }
    }
}



#Preview {
    SongsListView(currentUser: nil)
}

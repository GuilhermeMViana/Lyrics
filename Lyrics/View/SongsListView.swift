//
//  SongsList.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 23/04/26.
//

import SwiftUI

struct SongsListView: View {
    @State private var results = [Result]()
    @State private var search = "Eminem"
    
    var body: some View {
        NavigationStack {
            List(results, id: \.trackId) { item in
                VStack(alignment: .leading) {
                   LyricsListItem(item: item)
                }
            }
            .selectionDisabled()
            .task {
                await loadData()
            }
        }
        .searchable(text: $search)
        .onChange(of: search) { oldValue, newValue in
            Task {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(search)&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
}



#Preview {
    SongsListView()
}

//
//  SongsListViewModel.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 23/04/26.
//

import Foundation
import Combine

@MainActor
final class SongsListViewModel: ObservableObject {
    @Published var results: [Music] = []
    @Published var search: String = ""

    private var searchTask: Task<Void, Never>?

    init() {
        Task { await loadData() }
    }

    func updateSearch(_ text: String) {
        search = text
        searchTask?.cancel()
        searchTask = Task {
            try? await Task.sleep(nanoseconds: 400_000_000) // 0.4s
            guard !Task.isCancelled else { return }
            await loadData()
        }
    }

    func loadData() async {
        let query = search.trimmingCharacters(in: .whitespacesAndNewlines)
        let term = query.isEmpty ? "pop" : query
        guard let encoded = term.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }

        let urlString = "https://itunes.apple.com/search?term=\(encoded)&entity=song"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(MusicResponse.self, from: data) {
                results = decodedResponse.musics
            }
        } catch {
            print("Invalid data: \(error)")
        }
    }
}

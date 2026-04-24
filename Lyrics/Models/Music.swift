//
//  Music.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 23/04/26.
//

import SwiftData

struct MusicResponse: Codable {
    var musics: [Music]
}

@Model
class Music: Codable {
    var trackId: Int
    var artistName: String
    var trackName: String
    var collectionName: String
    
    enum CodingKeys: String, CodingKey {
        case trackId, artistName, trackName, collectionName
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.trackId = try container.decode(Int.self, forKey: .trackId)
        self.artistName = try container.decode(String.self, forKey: .artistName)
        self.trackName = try container.decode(String.self, forKey: .trackName)
        self.collectionName = try container.decode(String.self, forKey: .collectionName)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(trackId, forKey: .trackId)
        try container.encode(artistName, forKey: .artistName)
        try container.encode(trackName, forKey: .trackName)
        try container.encode(collectionName, forKey: .collectionName)
    }
    
    init(trackId: Int, artistName: String, trackName: String, collectionName: String) {
        self.trackId = trackId
        self.artistName = artistName
        self.trackName = trackName
        self.collectionName = collectionName
    }
}

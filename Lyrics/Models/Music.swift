//
//  Music.swift
//  Lyrics
//
//  Created by Guilherme Muniz Viana on 23/04/26.
//

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var artistName: String
    var trackName: String
}

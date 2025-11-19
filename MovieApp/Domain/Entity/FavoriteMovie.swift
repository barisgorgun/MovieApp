//
//  FavoriteMovie.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import Foundation

struct FavoriteMovie: Identifiable, Codable, Equatable, Hashable {
    let id: Int
    let name: String
    let posterPath: String?
}

extension FavoriteMovie {
    var posterURL: URL? {
        guard let path = posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(path)")
    }
}

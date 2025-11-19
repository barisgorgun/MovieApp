//
//  Movie.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

struct Movie: Identifiable, Hashable, Equatable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let voteAverage: Double

    var posterURL: URL? {
        URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")
    }
}

extension Movie {
    func toFavoriteMovie() -> FavoriteMovie {
        FavoriteMovie(
            id: id,
            name: title,
            posterPath: posterPath
        )
    }
}

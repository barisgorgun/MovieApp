//
//  MovieDetail.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

struct MovieDetail: Identifiable, Equatable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let backdropPath: String?
    let voteAverage: Double
    let runtime: Int?
    let releaseDate: String?
    let genres: [Genre]
    let cast: [Cast]

    init(
        id: Int,
        title: String,
        overview: String,
        posterPath: String?,
        backdropPath: String?,
        voteAverage: Double,
        runtime: Int?,
        releaseDate: String?,
        genres: [Genre],
        cast: [Cast]
    ) {
        self.id = id
        self.title = title
        self.overview = overview
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.voteAverage = voteAverage
        self.runtime = runtime
        self.releaseDate = releaseDate
        self.genres = genres
        self.cast = cast
    }
}

//
//  MovieDetailMapper.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

extension MovieDetailDTO {

    func toDomain(cast: [Cast]) -> MovieDetail {
        MovieDetail(
            id: id ?? 0,
            title: title ?? "",
            overview: overview ?? "",
            posterPath: posterPath,
            backdropPath: backdropPath,
            voteAverage: voteAverage ?? 0.0,
            runtime: runtime,
            releaseDate: releaseDate,
            genres: genres?.map { $0.toDomain() } ?? [],
            cast: cast
        )
    }
}

extension GenreDTO {
    
    func toDomain() -> Genre {
        Genre(
            id: id ?? 0,
            name: name ?? ""
        )
    }
}

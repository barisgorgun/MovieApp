//
//  MovieMapper.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

extension MovieDTO {

    func toDomain() -> Movie {
        Movie(
            id: id ?? 0,
            title: title ?? "",
            overview: overview ?? "",
            posterPath: posterPath,
            voteAverage: voteAverage ?? 0.0
        )
    }
}

extension MovieListResponseDTO {
    
    func toDomain() -> MoviePage {
        MoviePage(
            movies: results.map { $0.toDomain() },
            page: page ?? 0,
            totalPages: totalPages ?? 0
        )
    }
}

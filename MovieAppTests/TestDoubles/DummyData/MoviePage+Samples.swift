//
//  MoviePage+Samples.swift
//  MovieAppTests
//
//  Created by Gorgun, Baris on 20.11.2025.
//

import Foundation
@testable import MovieApp

extension MoviePage {

    static func sample(
        page: Int = 1,
        totalPages: Int = 1,
        movies: [Movie]
    ) -> MoviePage {
        MoviePage(
            movies: movies,
            page: page,
            totalPages: totalPages
        )
    }

    static func sample(
        page: Int = 1,
        totalPages: Int = 3,
        movieCount: Int = 20
    ) -> MoviePage {
        MoviePage(
            movies: Movie.sampleList(count: movieCount, startingAt: page * 100),
            page: page,
            totalPages: totalPages
        )
    }
}

//
//  Movie+Samples.swift
//  MovieAppTests
//
//  Created by Gorgun, Baris on 20.11.2025.
//

import Foundation
@testable import MovieApp

extension Movie {
    
    static func sample(
        id: Int = 1,
        title: String = "Movie"
    ) -> Movie {
        Movie(
            id: id,
            title: "\(title) \(id)",
            overview: "Overview for movie \(id)",
            posterPath: "/test-\(id).jpg",
            voteAverage: 7.5
        )
    }

    static func sampleList(count: Int, startingAt id: Int = 1) -> [Movie] {
        (0..<count).map { i in
            Movie.sample(id: id + i)
        }
    }
}

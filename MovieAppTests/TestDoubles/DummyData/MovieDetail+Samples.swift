//
//  MovieDetail+Samples.swift
//  MovieAppTests
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import Foundation
@testable import MovieApp

extension MovieDetail {
    
    static func sample(
        id: Int = 1,
        title: String = "Test Movie"
    ) -> MovieDetail {
        MovieDetail(
            id: 1,
            title: title,
            overview: "A test overview",
            posterPath: "/poster.jpg",
            backdropPath: "/backdrop.jpg",
            voteAverage: 7.5,
            tagline: "tagline",
            runtime: 120,
            releaseDate: "/backdrop.jpg",
            genres: [],
            cast: []
        )
    }
}

extension Cast {
    static func sample(id: Int = 1, name: String = "Actor") -> [Cast] {
        [Cast(id: id, name: name, character: "Hero", profilePath: nil)]
    }
}

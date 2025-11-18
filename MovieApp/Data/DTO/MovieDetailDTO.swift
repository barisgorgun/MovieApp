//
//  MovieDetailDTO.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

struct MovieDetailDTO: Decodable {
    let id: Int?
    let title: String?
    let overview: String?
    let posterPath: String?
    let backdropPath: String?
    let voteAverage: Double?
    let runtime: Int?
    let releaseDate: String?
    let genres: [GenreDTO]?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
        case runtime
        case releaseDate = "release_date"
        case genres
    }
}

struct GenreDTO: Decodable {
    let id: Int?
    let name: String?
}

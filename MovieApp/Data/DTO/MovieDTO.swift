//
//  MovieDTO.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

struct MovieListResponseDTO: Decodable {
    let page: Int?
    let results: [MovieDTO]
    let totalPages: Int?
    let totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct MovieDTO: Decodable {
    let id: Int?
    let title: String?
    let overview: String?
    let posterPath: String?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}

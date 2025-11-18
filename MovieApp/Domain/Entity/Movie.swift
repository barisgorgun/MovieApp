//
//  Movie.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

struct Movie: Identifiable, Equatable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let voteAverage: Double
}

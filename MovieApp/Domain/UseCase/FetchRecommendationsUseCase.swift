//
//  FetchRecommendationsUseCase.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

protocol FetchRecommendationsUseCase {
    func execute(movieID: Int, page: Int) async throws -> MoviePage
}

final class FetchRecommendationsUseCaseImpl: FetchRecommendationsUseCase {
    private let movieRepository: MovieRepository

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func execute(movieID: Int, page: Int) async throws -> MoviePage {
        try await movieRepository.fetchRecommendations(movieID: movieID, page: page)
    }
}

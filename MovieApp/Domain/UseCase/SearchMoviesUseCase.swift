//
//  SearchMoviesUseCase.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

protocol SearchMoviesUseCase {
    func execute(query: String) async throws -> [Movie]
}

final class SearchMoviesUseCaseImpl: SearchMoviesUseCase {
    private let repository: MovieRepository

    init(repository: MovieRepository) {
        self.repository = repository
    }

    func execute(query: String) async throws -> [Movie] {
        try await repository.searchMovies(query: query)
    }
}

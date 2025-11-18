//
//  FetchMovieCreditsUseCase.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

protocol FetchMovieCreditsUseCase {
    func execute(id: Int) async throws -> [Cast]
}

final class FetchMovieCreditsUseCaseImpl: FetchMovieCreditsUseCase {
    private let repository: MovieRepository

    init(repository: MovieRepository) {
        self.repository = repository
    }

    func execute(id: Int) async throws -> [Cast] {
        try await repository.fetchMovieCredits(id: id)
    }
}

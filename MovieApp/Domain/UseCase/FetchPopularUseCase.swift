//
//  FetchPopularUseCase.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

protocol FetchPopularUseCase {
    func execute(page: Int) async throws -> [Movie]
}

final class FetchPopularUseCaseImpl: FetchPopularUseCase {
    private let repository: MovieRepository

    init(repository: MovieRepository) {
        self.repository = repository
    }

    func execute(page: Int) async throws -> [Movie] {
        try await repository.fetchPopular(page: page)
    }
}

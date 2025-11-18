//
//  FetchTopRatedUseCase.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

protocol FetchTopRatedUseCase {
    func execute(page: Int) async throws -> [Movie]
}

final class FetchTopRatedUseCaseImpl: FetchTopRatedUseCase {
    private let repository: MovieRepository

    init(repository: MovieRepository) {
        self.repository = repository
    }

    func execute(page: Int) async throws -> [Movie] {
        try await repository.fetchTopRated(page: page)
    }
}

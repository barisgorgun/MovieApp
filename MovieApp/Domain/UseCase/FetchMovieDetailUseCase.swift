//
//  FetchMovieDetailUseCase.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

protocol FetchMovieDetailUseCase {
    func execute(id: Int) async throws -> MovieDetail
}

final class FetchMovieDetailUseCaseImpl: FetchMovieDetailUseCase {
    private let repository: MovieRepository

    init(repository: MovieRepository) {
        self.repository = repository
    }

    func execute(id: Int) async throws -> MovieDetail {
        try await repository.fetchDetail(id: id)
    }
}

//
//  IsFavoriteUseCase.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import Foundation

protocol IsFavoriteUseCase {
    func execute(_ movieID: Int) async -> Bool
}

final class IsFavoriteUseCaseImpl: IsFavoriteUseCase {
    private let repository: FavoritesRepository

    init(repository: FavoritesRepository) {
        self.repository = repository
    }

    func execute(_ movieID: Int) async -> Bool {
        await repository.isFavorite(movieID)
    }
}

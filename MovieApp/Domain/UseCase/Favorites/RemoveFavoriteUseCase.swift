//
//  RemoveFavoriteUseCase.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import Foundation

protocol RemoveFavoriteUseCase: Sendable {
    func execute(_ movieID: Int) async
}

final class RemoveFavoriteUseCaseImpl: RemoveFavoriteUseCase {
    private let favoritesRepository: FavoritesRepository

    init(favoritesRepository: FavoritesRepository) {
        self.favoritesRepository = favoritesRepository
    }

    func execute(_ movieID: Int) async {
        await favoritesRepository.removeFavorite(movieID)
    }
}

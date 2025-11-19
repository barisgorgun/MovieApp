//
//  AddToFavoritesUseCase.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import Foundation

protocol AddToFavoritesUseCase {
    func execute(_ movie: FavoriteMovie) async
}

final class AddToFavoritesUseCaseImpl: AddToFavoritesUseCase {
    private let repository: FavoritesRepository

    init(repository: FavoritesRepository) {
        self.repository = repository
    }

    func execute(_ movie: FavoriteMovie) async {
        await repository.addFavorite(movie)
    }
}

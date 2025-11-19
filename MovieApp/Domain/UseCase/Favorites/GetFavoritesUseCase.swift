//
//  GetFavoritesUseCase.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import Foundation

protocol GetFavoritesUseCase {
    func execute() async -> [FavoriteMovie]
}

final class GetFavoritesUseCaseImpl: GetFavoritesUseCase {
    private let favoritesRepository: FavoritesRepository

    init(favoritesRepository: FavoritesRepository) {
        self.favoritesRepository = favoritesRepository
    }
    
    func execute() async -> [FavoriteMovie] {
        await favoritesRepository.getFavorites()
    }
}

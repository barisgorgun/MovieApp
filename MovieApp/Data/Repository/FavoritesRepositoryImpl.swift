//
//  FavoritesRepositoryImpl.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import Foundation

final class FavoritesRepositoryImpl: FavoritesRepository {
    private let storage: FavoritesStorageProtocol

    init(storage: FavoritesStorageProtocol) {
        self.storage = storage
    }


    func getFavorites() async -> [FavoriteMovie] {
        await storage.loadFavorites()
    }
    
    func addFavorite(_ movie: FavoriteMovie) async {
        var current = await storage.loadFavorites()
        guard !current.contains(where: { $0.id == movie.id }) else {
            return
        }
        current.append(movie)
        await storage.saveFavorites(current)
    }
    
    func removeFavorite(_ movieID: Int) async {
        var current = await storage.loadFavorites()
        current.removeAll { $0.id == movieID }
        await storage.saveFavorites(current)
    }
    
    func isFavorite(_ movieID: Int) async -> Bool {
        var current = await storage.loadFavorites()
        return current.contains(where: { $0.id == movieID })
    }
}

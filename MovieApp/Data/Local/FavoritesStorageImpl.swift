//
//  FavoritesStorageImpl.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import Foundation

actor FavoritesStorageImpl: FavoritesStorageProtocol {
    private let key = "favorite_movies"

    func loadFavorites() async -> [FavoriteMovie] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        return (try? JSONDecoder().decode([FavoriteMovie].self, from: data)) ?? []
    }
    
    func saveFavorites(_ favorites: [FavoriteMovie]) async {
        let data = try? JSONEncoder().encode(favorites)
        UserDefaults.standard.set(data, forKey: key)
    }
}

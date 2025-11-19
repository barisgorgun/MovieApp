//
//  FavoritesStorage.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import Foundation

protocol FavoritesStorageProtocol {
    func loadFavorites() async -> [FavoriteMovie]
    func saveFavorites(_ favorites: [FavoriteMovie]) async
}

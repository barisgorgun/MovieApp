//
//  FavoritesRepository.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import Foundation

protocol FavoritesRepository {
    func getFavorites() async -> [FavoriteMovie]
    func addFavorite(_ movie: FavoriteMovie) async
    func removeFavorite(_ movieID: Int) async
    func isFavorite(_ movieID: Int) async -> Bool
}

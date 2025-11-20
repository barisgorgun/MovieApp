//
//  MockFavoritesRepository.swift
//  MovieAppTests
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import Foundation
@testable import MovieApp

final class MockFavoritesRepository: FavoritesRepository {
    var storedFavorites: [FavoriteMovie] = []
    var getFavoritesCalled = false
    var addCalled = false
    var removeCalled = false
    var isFavoriteCalled = false


    func getFavorites() async -> [FavoriteMovie] {
        getFavoritesCalled = true
        return storedFavorites
    }
    
    func addFavorite(_ movie: FavoriteMovie) async {
        addCalled = true
        if !storedFavorites.contains(where: { $0.id == movie.id }) {
            storedFavorites.append(movie)
        }
    }
    
    func removeFavorite(_ movieID: Int) async {
        removeCalled = true
        storedFavorites.removeAll { $0.id == movieID }
    }
    
    func isFavorite(_ movieID: Int) async -> Bool {
        isFavoriteCalled = true
        return storedFavorites.contains { $0.id == movieID }
    }
}

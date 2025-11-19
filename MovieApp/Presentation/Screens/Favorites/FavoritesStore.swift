//
//  FavoritesStore.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import Foundation
import Combine

@MainActor
final class FavoritesStore: ObservableObject {
    @Published private(set) var favorites: [FavoriteMovie] = []

    private let getFavoritesUseCase: GetFavoritesUseCase
    private let removeFavoriteUseCase: RemoveFavoriteUseCase
    private let addToFavoritesUseCase: AddToFavoritesUseCase
    private let isFavoriteUseCase: IsFavoriteUseCase

    init(
        getFavoritesUseCase: GetFavoritesUseCase,
        removeFavoriteUseCase: RemoveFavoriteUseCase,
        addToFavoritesUseCase: AddToFavoritesUseCase,
        isFavoriteUseCase: IsFavoriteUseCase
    ) {
        self.getFavoritesUseCase = getFavoritesUseCase
        self.removeFavoriteUseCase = removeFavoriteUseCase
        self.addToFavoritesUseCase = addToFavoritesUseCase
        self.isFavoriteUseCase = isFavoriteUseCase
    }

    func load() async {
        favorites = await getFavoritesUseCase.execute()
    }

    func toggle(movie: FavoriteMovie) async {
        let exists = favorites.contains { $0.id == movie.id }

        if exists {
            await removeFavoriteUseCase.execute(movie.id)
        } else {
            await addToFavoritesUseCase.execute(movie)
        }

        favorites = await getFavoritesUseCase.execute()
    }

    func isFavorite(_ id: Int) -> Bool {
        favorites.contains { $0.id == id }
    }
}

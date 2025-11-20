//
//  FavoritesStoreTests.swift
//  MovieAppTests
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import XCTest
@testable import MovieApp

final class FavoritesStoreTests: XCTestCase {
    var mockRepo: MockFavoritesRepository!
    var store: FavoritesStore!

    override func setUp() async throws {
        try await super.setUp()
        mockRepo = MockFavoritesRepository()
        store = await FavoritesStore(
            getFavoritesUseCase: GetFavoritesUseCaseImpl(favoritesRepository: mockRepo),
            removeFavoriteUseCase: RemoveFavoriteUseCaseImpl(favoritesRepository: mockRepo),
            addToFavoritesUseCase: AddToFavoritesUseCaseImpl(repository: mockRepo),
            isFavoriteUseCase: IsFavoriteUseCaseImpl(repository: mockRepo)
        )
    }

    override func tearDown() async throws {
        mockRepo = nil
        store = nil
        try await super.tearDown()
    }

    func testLoadFavorites() async throws {
        // Given
        mockRepo.storedFavorites = [
            FavoriteMovie(id: 1, name: "A", posterPath: nil)
        ]

        // When
        await store.load()

        // Then
        XCTAssertTrue(mockRepo.getFavoritesCalled)
        XCTAssertEqual(mockRepo.storedFavorites.count, 1)
    }

    @MainActor
    func testToggle_addsMovieWhenNotFavorite() async throws {
        // Given
        let movie = FavoriteMovie(id: 5, name: "test", posterPath: nil)

        // When
        await store.toggle(movie: movie)

        // Then
        XCTAssertEqual(store.favorites.count, 1)
        XCTAssertEqual(store.favorites.first?.id, 5)
        XCTAssertTrue(mockRepo.addCalled)
    }

    @MainActor
    func testToggle_removesMovieWhenAlreadyFavorite() async throws {
        // Given
        let movie = FavoriteMovie(id: 3, name: "Movie", posterPath: nil)
        mockRepo.storedFavorites = [movie]
        await store.load()

        // When
        await store.toggle(movie: movie)

        // Then
        XCTAssertTrue(mockRepo.removeCalled)
        XCTAssertEqual(store.favorites.count, 0)
    }

    @MainActor
    func testIsFavorite_true() async throws {
        // Given
        let movie = FavoriteMovie(id: 10, name: "X", posterPath: nil)
        mockRepo.storedFavorites = [movie]

        // When
        await store.load()

        // Then
        XCTAssertTrue(store.isFavorite(10))
    }

    @MainActor
    func testIsFavorite_false() async throws {
        // When
        await store.load()

        // Then
        XCTAssertFalse(store.isFavorite(99))
    }
}

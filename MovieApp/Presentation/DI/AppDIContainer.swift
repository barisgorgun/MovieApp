//
//  AppDIContainer.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

final class AppDIContainer {

    // MARK: Repositories

    private let movieRepository: MovieRepository

    // MARK: - Favorites

    private let favoritesStorage: FavoritesStorageProtocol
    private let favoritesRepository: FavoritesRepository

    // MARK: - Init

    init(
        movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
        self.favoritesStorage = FavoritesStorageImpl()
        self.favoritesRepository = FavoritesRepositoryImpl(storage: favoritesStorage)
    }

    // MARK: - Use Case Factories

    func makeFetchTopRatedUseCase() -> FetchTopRatedUseCase {
        FetchTopRatedUseCaseImpl(repository: movieRepository)
    }

    func makeFetchPopularUseCase() -> FetchPopularUseCase {
        FetchPopularUseCaseImpl(repository: movieRepository)
    }

    func makeFetchNowPlayingUseCase() -> FetchNowPlayingUseCase {
        FetchNowPlayingUseCaseImpl(repository: movieRepository)
    }

    func makeSearchMoviesUseCase() -> SearchMoviesUseCase {
        SearchMoviesUseCaseImpl(repository: movieRepository)
    }

    func makeFetchMovieDetailUseCase() -> FetchMovieDetailUseCase {
        FetchMovieDetailUseCaseImpl(repository: movieRepository)
    }

    func makeFetchMovieCreditsUseCase() -> FetchMovieCreditsUseCase {
        FetchMovieCreditsUseCaseImpl(repository: movieRepository)
    }

    func makeFetchRecommendationsUseCase() -> FetchRecommendationsUseCase {
        FetchRecommendationsUseCaseImpl(movieRepository: movieRepository)
    }

    // MARK: - ViewModel Factories

    func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel(
            fetchTopRatedUseCase: makeFetchTopRatedUseCase(),
            fetchPopularUseCase: makeFetchPopularUseCase(),
            fetchNowPlayingUseCase: makeFetchNowPlayingUseCase()
        )
    }

    func makeMovieDetailViewModel(movieID: Int) -> MovieDetailViewModel {
        MovieDetailViewModel(
            movieID: movieID,
            fetchMovieDetailUseCase: makeFetchMovieDetailUseCase(),
            fetchMovieCreditsUseCase: makeFetchMovieCreditsUseCase(),
            fetchRecommendationsUseCase: makeFetchRecommendationsUseCase()
        )
    }

    func makeSearchViewModel() -> SearchViewModel {
        SearchViewModel(searchMoviesUseCase: makeSearchMoviesUseCase())
    }

    func makeFavoritesStore() -> FavoritesStore {
        FavoritesStore(
            getFavoritesUseCase: makeGetFavoritesUseCase(),
            removeFavoriteUseCase: makeRemoveFavoriteUseCase(),
            addToFavoritesUseCase: makeAddToFavoritesUseCase(),
            isFavoriteUseCase: makeIsFavoriteUseCase()
        )
    }

    // MARK: - Favorites UseCase Factories

    func makeGetFavoritesUseCase() -> GetFavoritesUseCase {
        GetFavoritesUseCaseImpl(favoritesRepository: favoritesRepository)
    }

    func makeAddToFavoritesUseCase() -> AddToFavoritesUseCase {
        AddToFavoritesUseCaseImpl(repository: favoritesRepository)
    }

    func makeRemoveFavoriteUseCase() -> RemoveFavoriteUseCase {
        RemoveFavoriteUseCaseImpl(favoritesRepository: favoritesRepository)
    }

    func makeIsFavoriteUseCase() -> IsFavoriteUseCase {
        IsFavoriteUseCaseImpl(repository: favoritesRepository)
    }
}

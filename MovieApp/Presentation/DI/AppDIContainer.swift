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

    // MARK: - Init

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
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
}

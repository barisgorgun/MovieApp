//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation
import Combine

@MainActor
final class MovieDetailViewModel: ObservableObject {
    @Published private(set) var state = MovieDetailState()
    @Published var cast: [Cast] = []
    @Published var recommendations = MovieListState()

    private let movieID: Int
    private let fetchMovieDetailUseCase: FetchMovieDetailUseCase
    private let fetchMovieCreditsUseCase: FetchMovieCreditsUseCase
    private let fetchRecommendationsUseCase: FetchRecommendationsUseCase

    init(
        movieID: Int,
        fetchMovieDetailUseCase: FetchMovieDetailUseCase,
        fetchMovieCreditsUseCase: FetchMovieCreditsUseCase,
        fetchRecommendationsUseCase: FetchRecommendationsUseCase
    ) {
        self.movieID = movieID
        self.fetchMovieDetailUseCase = fetchMovieDetailUseCase
        self.fetchMovieCreditsUseCase = fetchMovieCreditsUseCase
        self.fetchRecommendationsUseCase = fetchRecommendationsUseCase
    }

    func loadDetail() async {
        state.status = .loading

        do {
            let movieDetail = try await fetchMovieDetailUseCase.execute(id: movieID)
            state.movie = movieDetail

            async let creditsTask = fetchMovieCreditsUseCase.execute(id: movieID)
            async let recommendationsTask = fetchRecommendationsUseCase.execute(movieID: movieID, page: 1)

            let (credits, recommendationsPage) = try await (creditsTask, recommendationsTask)
            cast = credits
            recommendations = MovieListState(
                movies: recommendationsPage.movies,
                status: .loaded,
                page: recommendationsPage.page,
                canLoadMore: recommendationsPage.canLoadMore
            )

            state.status = .loaded
        } catch {
            state.status = .error(error.localizedDescription)
        }
    }

    func loadRecommendations() async {
        guard recommendations.canLoadMore else {
            return
        }

        do {
            let nextPage = recommendations.page
            let pageData = try await fetchRecommendationsUseCase.execute(movieID: movieID, page: nextPage)
            recommendations.appendPage(pageData)

        } catch {
            recommendations.status = .error("Failed to load recommendations")
        }
    }

    func loadCredits() async {
        do {
            cast = try await fetchMovieCreditsUseCase.execute(id: movieID)
        } catch {
            print("Credits yüklenemedi: \(error)")
        }
    }
}

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

    private let movieID: Int
    private let fetchMovieDetailUseCase: FetchMovieDetailUseCase
    private let fetchMovieCreditsUseCase: FetchMovieCreditsUseCase

    init(
        movieID: Int,
        fetchMovieDetailUseCase: FetchMovieDetailUseCase,
        fetchMovieCreditsUseCase: FetchMovieCreditsUseCase
    ) {
        self.movieID = movieID
        self.fetchMovieDetailUseCase = fetchMovieDetailUseCase
        self.fetchMovieCreditsUseCase = fetchMovieCreditsUseCase
    }

    func loadDetail() async {
        state.status = .loading

        do {
            let movieDetail = try await fetchMovieDetailUseCase.execute(id: movieID)
            state.movie = movieDetail
            Task {
                await loadCredits()
            }
            state.status = .loaded
        } catch {
            state.status = .error(error.localizedDescription)
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

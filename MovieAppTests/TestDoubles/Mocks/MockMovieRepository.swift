//
//  MockMovieRepository.swift
//  MovieAppTests
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import Foundation
@testable import MovieApp

final class MockMovieRepository: MovieRepository {
    // MARK: - Stub Data

    var detailResult: MovieDetail?
    var creditsResult: [Cast]?
    var recommendationsResult: MoviePage?
    var topRatedResult: MoviePage?
    var popularResult: MoviePage?
    var nowPlayingResult: MoviePage?

    var shouldThrowError = false

    // MARK: - Tracking Calls

    private(set) var fetchDetailCalled = false
    private(set) var fetchCreditsCalled = false
    private(set) var fetchRecommendationsCalled = false
    private(set) var fetchTopRatedCalled = false
    private(set) var fetchPopularCalled = false
    private(set) var fetchNowPlayingCalled = false


    // MARK: - Protocol Methods

    func fetchTopRated(page: Int) async throws -> MoviePage {
        fetchTopRatedCalled = true

        if shouldThrowError {
            throw URLError(.badServerResponse)
        }

        guard let topRated = topRatedResult else {
            throw URLError(.cannotParseResponse)
        }

        return topRated
    }

    func fetchPopular(page: Int) async throws -> MoviePage {
        fetchPopularCalled = true

        if shouldThrowError {
            throw URLError(.badServerResponse)
        }

        guard let popular = popularResult else {
            throw URLError(.cannotParseResponse)
        }

        return popular
    }

    func fetchNowPlaying(page: Int) async throws -> MoviePage {
        fetchNowPlayingCalled = true

        if shouldThrowError {
            throw URLError(.badServerResponse)
        }

        guard let nowPlaying = nowPlayingResult else {
            throw URLError(.cannotParseResponse)
        }

        return nowPlaying
    }

    func searchMovies(query: String, page: Int) async throws -> MoviePage {
        recommendationsResult ?? MoviePage(movies: [], page: 0, totalPages: 0)
    }

    func fetchDetail(id: Int) async throws -> MovieDetail {
        fetchDetailCalled = true

        if shouldThrowError {
            throw URLError(.badServerResponse)
        }

        guard let detail = detailResult else {
            throw URLError(.cannotParseResponse)
        }
        return detail
    }

    func fetchMovieCredits(id: Int) async throws -> [Cast] {
        fetchCreditsCalled = true

        if shouldThrowError {
            throw URLError(.badServerResponse)
        }

        guard let casts = creditsResult else {
            throw URLError(.cannotParseResponse)
        }

        return casts
    }

    func fetchRecommendations(movieID: Int, page: Int) async throws -> MoviePage {
        fetchRecommendationsCalled = true

        if shouldThrowError {
            throw URLError(.badServerResponse)
        }

        guard let recommendations = recommendationsResult else {
            throw URLError(.cannotParseResponse)
        }

        return recommendations
    }
}

//
//  MovieDetailViewModelTests.swift
//  MovieAppTests
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import XCTest
@testable import MovieApp

@MainActor
final class MovieDetailViewModelTests: XCTestCase {
    var mockRepo: MockMovieRepository!
    var viewModel: MovieDetailViewModel!

    override func setUp() async throws {
        try await super.setUp()

        mockRepo = MockMovieRepository()

        let detailUC = FetchMovieDetailUseCaseImpl(repository: mockRepo)
        let creditUC = FetchMovieCreditsUseCaseImpl(repository: mockRepo)
        let recommendationsUC =  FetchRecommendationsUseCaseImpl(movieRepository: mockRepo)

        viewModel = MovieDetailViewModel(
            movieID: 1,
            fetchMovieDetailUseCase: detailUC,
            fetchMovieCreditsUseCase: creditUC,
            fetchRecommendationsUseCase: recommendationsUC
        )
    }

    override func tearDown() async throws {
        mockRepo = nil
        viewModel = nil
        try await super.tearDown()
    }

    func testLoadDetail_success() async throws {
        // Given
        mockRepo.detailResult = MovieDetail.sample()
        mockRepo.creditsResult = Cast.sample()
        mockRepo.recommendationsResult = MoviePage.sample(movieCount: 1)

        // When
        await viewModel.loadDetail()

        // Then
        XCTAssertEqual(viewModel.state.status, .loaded)
        XCTAssertNotNil(viewModel.state.movie)
        XCTAssertEqual(viewModel.cast.count, 1)
        XCTAssertEqual(viewModel.recommendations.movies.count, 1)

        XCTAssertTrue(mockRepo.fetchDetailCalled)
        XCTAssertTrue(mockRepo.fetchCreditsCalled)
        XCTAssertTrue(mockRepo.fetchRecommendationsCalled)
    }

    func testLoadDetail_failure() async throws {
        // Given
        mockRepo.shouldThrowError = true

        // When
        await viewModel.loadDetail()

        // Then
        switch viewModel.state.status {
        case .error(_):
            XCTAssertTrue(true)
        default:
            XCTFail("Status should be error")
        }
    }

    func testLoadCredits_success() async throws {
        // Given
        mockRepo.creditsResult = Cast.sample(id: 3)

        // When
        await viewModel.loadCredits()

        // Then
        XCTAssertEqual(viewModel.cast.first?.id, 3)
        XCTAssertTrue(mockRepo.fetchCreditsCalled)
    }

    func testLoadRecommendations_success() async throws {
        // Given
        viewModel.recommendations = MovieListState()
        mockRepo.recommendationsResult = MoviePage.sample(
            page: 1,
            totalPages: 3,
            movies: [Movie(id: 20, title: "Reco 20", overview: "", posterPath: nil, voteAverage: 6.5)]
        )

        // When
        await viewModel.loadRecommendations()

        // Then
        XCTAssertEqual(viewModel.recommendations.movies.count, 1)
        XCTAssertTrue(mockRepo.fetchRecommendationsCalled)
    }

    func testLoadRecommendations_noMorePages() async throws {
        // Given
        viewModel.recommendations = MovieListState(
            movies: [],
            status: .loaded,
            page: 5,
            canLoadMore: false
        )

        // When
        await viewModel.loadRecommendations()

        // Then
        XCTAssertFalse(mockRepo.fetchRecommendationsCalled)
    }

}

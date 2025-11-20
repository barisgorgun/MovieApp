//
//  HomeViewModelTests.swift
//  MovieAppTests
//
//  Created by Gorgun, Baris on 20.11.2025.
//

import XCTest
@testable import MovieApp

@MainActor
final class HomeViewModelTests: XCTestCase {

    var mockRepo: MockMovieRepository!
    var viewModel: HomeViewModel!

    override func setUp() async throws {
        try await super.setUp()
        mockRepo = MockMovieRepository()

        let mockFetchTopRatedUseCase = FetchTopRatedUseCaseImpl(repository: mockRepo)
        let mockFetchPopularUseCase = FetchPopularUseCaseImpl(repository: mockRepo)
        let mockFetchNowPlayingUseCase = FetchNowPlayingUseCaseImpl(repository: mockRepo)

        viewModel = HomeViewModel(
            fetchTopRatedUseCase: mockFetchTopRatedUseCase,
            fetchPopularUseCase: mockFetchPopularUseCase,
            fetchNowPlayingUseCase: mockFetchNowPlayingUseCase
        )
    }

    override func tearDown() async throws {
        mockRepo = nil
        viewModel = nil
        try await super.tearDown()
    }

    func testLoadInitialData_success() async throws {
        // Given
        mockRepo.topRatedResult = MoviePage.sample(page: 1, movieCount: 15)
        mockRepo.popularResult = MoviePage.sample(page: 2, movieCount: 16)
        mockRepo.nowPlayingResult = MoviePage.sample(page: 3, movieCount: 17)

        // When
        await viewModel.loadInitialData()

        // Then
        XCTAssertEqual(viewModel.topRated.movies.count, 15)
        XCTAssertEqual(viewModel.popular.movies.count, 16)
        XCTAssertEqual(viewModel.nowPlaying.movies.count, 17)

        XCTAssertEqual(viewModel.topRated.page, 1)
        XCTAssertEqual(viewModel.popular.page, 2)
        XCTAssertEqual(viewModel.nowPlaying.page, 3)

        XCTAssertTrue(mockRepo.fetchTopRatedCalled)
        XCTAssertTrue(mockRepo.fetchPopularCalled)
        XCTAssertTrue(mockRepo.fetchNowPlayingCalled)
    }

    func testLoadInitialData_failure() async throws {
        // Given
        mockRepo.shouldThrowError = true

        // When
        await viewModel.loadInitialData()

        // Then
        XCTAssertEqual(viewModel.topRated.status, .error("The operation couldn’t be completed. (NSURLErrorDomain error -1011.)"))
        XCTAssertEqual(viewModel.popular.status, .error("The operation couldn’t be completed. (NSURLErrorDomain error -1011.)"))
        XCTAssertEqual(viewModel.nowPlaying.status, .error("The operation couldn’t be completed. (NSURLErrorDomain error -1011.)"))
    }
}

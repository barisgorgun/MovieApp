//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation
import Combine

@MainActor
final class HomeViewModel: ObservableObject {

    // MARK: - Published Lists

    @Published var topRated = MovieListState()
    @Published var nowPlaying = MovieListState()
    @Published var popular = MovieListState()

    // MARK: - Use Cases

    private let fetchTopRatedUseCase: FetchTopRatedUseCase
    private let fetchPopularUseCase: FetchPopularUseCase
    private let fetchNowPlayingUseCase: FetchNowPlayingUseCase

    // MARK: - Init

    init(
        fetchTopRatedUseCase: FetchTopRatedUseCase,
        fetchPopularUseCase: FetchPopularUseCase,
        fetchNowPlayingUseCase: FetchNowPlayingUseCase
    ) {
        self.fetchTopRatedUseCase = fetchTopRatedUseCase
        self.fetchPopularUseCase = fetchPopularUseCase
        self.fetchNowPlayingUseCase = fetchNowPlayingUseCase
    }

    // MARK: - Public API

    func loadInitialData() async {
        topRated.status = .loadingInitial
        popular.status = .loadingInitial
        nowPlaying.status = .loadingInitial

        do {
            async let topRatedData = fetchTopRatedUseCase.execute(page: 1)
            async let popularData = fetchPopularUseCase.execute(page: 1)
            async let nowPlayingData = fetchNowPlayingUseCase.execute(page: 1)

            let (topRatedResult, popularResult, nowPlayingResult) = try await (topRatedData, popularData, nowPlayingData)

            topRated.movies = topRatedResult.movies
            topRated.page = 1
            topRated.canLoadMore = topRatedResult.canLoadMore
            topRated.status = .loaded

            popular.movies = popularResult.movies
            popular.page = 1
            popular.canLoadMore = popularResult.canLoadMore
            popular.status = .loaded

            nowPlaying.movies = nowPlayingResult.movies
            nowPlaying.page = 1
            nowPlaying.canLoadMore = nowPlayingResult.canLoadMore
            nowPlaying.status = .loaded

        } catch {
            topRated.status = .error(error.localizedDescription)
            popular.status = .error(error.localizedDescription)
            nowPlaying.status = .error(error.localizedDescription)
        }
    }

    // MARK: - Infinite Scroll for Each List

    func loadMoreTopRated() async {
        guard topRated.canLoadMore, topRated.status != .loadingMore else {
            return
        }

        topRated.status = .loadingMore
        
        do {
            let nextPage = topRated.page + 1
            let result = try await fetchTopRatedUseCase.execute(page: nextPage)
            topRated.movies.append(contentsOf: result.movies)
            topRated.page = nextPage
            topRated.canLoadMore = result.canLoadMore
            topRated.status = .loaded
        } catch {
            topRated.status = .error(error.localizedDescription)
        }
    }

    func loadMoreNowPlaying() async {
        guard nowPlaying.canLoadMore, nowPlaying.status != .loadingMore else {
            return
        }

        nowPlaying.status = .loadingMore

        do {
            let nextPage = nowPlaying.page + 1
            let result = try await fetchNowPlayingUseCase.execute(page: nextPage)
            nowPlaying.movies.append(contentsOf: result.movies)
            nowPlaying.page = nextPage
            nowPlaying.canLoadMore = result.canLoadMore
            nowPlaying.status = .loaded

        } catch {
            nowPlaying.status = .error(error.localizedDescription)
        }
    }

    func loadMorePopular() async {
        guard popular.canLoadMore, popular.status != .loadingMore else {
            return
        }

        popular.status = .loadingMore

        do {
            let nextPage = popular.page + 1
            let result = try await fetchPopularUseCase.execute(page: nextPage)
            popular.movies.append(contentsOf: result.movies)
            popular.canLoadMore = result.canLoadMore
            popular.page = nextPage
            popular.status = .loaded

        } catch {
            popular.status = .error(error.localizedDescription)
        }
    }
}

//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import Foundation
import Combine

@MainActor
final class SearchViewModel: ObservableObject {
    // MARK: - Public State

    @Published var query = ""
    @Published var state = MovieListState()

    // MARK: - Private

    private let searchMoviesUseCase: SearchMoviesUseCase
    private var searchTask: Task<Void, Never>? = nil
    private var debounceTask: Task<Void, Never>? = nil


    // MARK: - Init

    init(searchMoviesUseCase: SearchMoviesUseCase) {
        self.searchMoviesUseCase = searchMoviesUseCase
    }

    // MARK: - User Input

    func onQueryChange(_ newValue: String) {
        query = newValue

        debounceTask?.cancel()

        debounceTask = Task { [weak self] in
            try? await Task.sleep(for: .milliseconds(350))
            await self?.performSearch()

        }
    }

    func performSearch() async {

        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            state = MovieListState()
            return
        }

        searchTask?.cancel()
        state.status = .loadingInitial
        state.page = 1
        state.canLoadMore = true

        searchTask = Task {
            await loadPage(page: 1)
        }
    }

    func loadNextPage() async {
        guard state.canLoadMore else {
            return
        }

        guard state.status != .loadingMore else {
            return
        }

        state.status = .loadingMore

        await loadPage(page: state.page + 1)
    }

    // MARK: - Private funcs

    func loadPage(page: Int) async {
        do {
            let result = try await searchMoviesUseCase.execute(query: query, page: page)

            if page == 1 {
                state.movies = result.movies
            } else {
                state.movies.append(contentsOf: result.movies)
            }

            state.page = result.page
            state.canLoadMore = result.canLoadMore
            state.status = .loaded
        } catch {
            state.status = .error(error.localizedDescription)
        }
    }
}

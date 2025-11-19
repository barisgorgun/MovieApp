//
//  SearchResultsView.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import SwiftUI

struct SearchResultsView: View {
    let state: MovieListState
    let onLoadMore: () async -> Void
    let diContainer: AppDIContainer
    private let grid = [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16)
        ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: grid, spacing: 20) {
                ForEach(Array(state.movies.enumerated()), id: \.element.id) { index, movie in

                    NavigationLink {
                        MovieDetailView(movieID: movie.id, diContainer: diContainer)
                    } label: {
                        SearchMovieCard(movie: movie)
                    }
                    .buttonStyle(.plain)
                    .onAppear {
                        triggerLoadMore(index: index)
                    }
                }
                if state.status == .loadingMore {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                }
            }
            .padding(.horizontal)
        }
    }

    private func triggerLoadMore(index: Int) {
        guard state.canLoadMore, state.status != .loadingMore else {
            return
        }

        let thresHold = max(state.movies.count - 4, 0)
        if index == thresHold {
            Task { await onLoadMore() }
        }
    }
}

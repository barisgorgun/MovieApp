//
//  MovieHorizontalList.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import SwiftUI

struct MovieHorizontalList: View {
    let state: MovieListState
    let onLoadMore: () async -> Void

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {

                ForEach(Array(state.movies.enumerated()), id: \.element.id) { index, movie in
                    MovieCard(movie: movie)
                        .onAppear {
                            triggerLoadMoreIfNeeded(currentIndex: index)
                        }
                }

                if state.status == .loadingMore {
                    ProgressView()
                        .frame(width: 60, height: 180)
                }
            }
        }
    }

    private func triggerLoadMoreIfNeeded(currentIndex: Int) {
        guard state.canLoadMore,
              state.status != .loadingMore
        else { return }

        let total = state.movies.count
        let threshold = max(total - 4, 0)

        if currentIndex == threshold {
            Task { await onLoadMore() }
        }
    }
}

//
//  RecommendationSection.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import SwiftUI

struct RecommendationSection: View {
    let title: String = "Recommended for You"
    let state: MovieListState
    let onLoadMore: () async -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(Array(state.movies.enumerated()), id: \.element.id) { index, movie in
                        MovieCard(movie: movie)
                            .onAppear {
                                triggerLoadMore(index: index)
                            }
                    }
                }
            }
        }
        .padding(.horizontal)
    }

    private func triggerLoadMore(index: Int) {
        guard state.canLoadMore else { return }

        let threshold = max(state.movies.count - 4, 0)
        if index == threshold {
            Task { await onLoadMore() }
        }
    }
}

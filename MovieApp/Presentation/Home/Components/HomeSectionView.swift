//
//  HomeSectionView.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import SwiftUI

struct HomeSectionView: View {
    let title: String
    let state: MovieListState
    let onLoadMore: () async -> Void

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal, 4)

            content
                .frame(height: 230)
        }
    }

    @ViewBuilder
    private var content: some View {
        switch state.status {
        case .idle, .loadingInitial:
            LoadingShimmerView()

        case .loaded, .loadingMore:
            MovieHorizontalList(
                state: state,
                onLoadMore: onLoadMore
            )

        case .error(let message):
            ErrorView(message: message, onRetry: onLoadMore)
        }
    }
}

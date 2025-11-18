//
//  HomeView.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    HomeSectionView(
                        title: "Top Rated",
                        state: viewModel.topRated,
                        onLoadMore: { await viewModel.loadMoreTopRated() }
                    )

                    HomeSectionView(
                        title: "Popular",
                        state: viewModel.popular,
                        onLoadMore: { await viewModel.loadMorePopular() }
                    )

                    HomeSectionView(
                        title: "Now Playing",
                        state: viewModel.nowPlaying,
                        onLoadMore: { await viewModel.loadMoreNowPlaying() }
                    )

                }
                .padding(.horizontal)
            }
            .navigationTitle("Movies")
            .task {
                await viewModel.loadInitialData()
            }
        }
    }
}

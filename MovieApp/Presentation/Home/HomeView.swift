//
//  HomeView.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel
    private let diContainer: AppDIContainer

    init(viewModel: HomeViewModel, diContainer: AppDIContainer) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.diContainer = diContainer
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
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailView(viewModel: diContainer.makeMovieDetailViewModel(movieID: movie.id))
            }
            .navigationTitle("Movies")
            .task {
                await viewModel.loadInitialData()
            }
        }
    }
}

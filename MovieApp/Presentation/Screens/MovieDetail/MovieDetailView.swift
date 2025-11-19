//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject var viewModel: MovieDetailViewModel
    @EnvironmentObject var favoritesStore: FavoritesStore
    private let movieID: Int

    init(movieID: Int, diContainer: AppDIContainer) {
        self.movieID = movieID
        _viewModel = StateObject(
            wrappedValue: diContainer.makeMovieDetailViewModel(movieID: movieID)
        )
    }

    var body: some View {
        Group {
            switch viewModel.state.status {
            case .idle, .loading:
                ProgressView("Loading...")
                    .task { await viewModel.loadDetail() }
            case .loaded:
                detailContent
            case .error(let message):
                MovieDetailErrorView(
                    message: message,
                    onRetry: { await viewModel.loadDetail() }
                )
            }
        }
        .navigationTitle("Movie Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {

                    if let movie = viewModel.state.movie {
                        Task { await favoritesStore.toggle(movie: movie.toFavoriteMovie())
                        }
                    }
                } label: {
                    Image(systemName: favoritesStore.isFavorite(movieID) ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                        .animation(.easeInOut, value: favoritesStore.favorites)
                }
            }
        }
    }

    private var detailContent: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                MovieDetailHeader(movie: viewModel.state.movie!)

                MovieDetailInfoSection(movie: viewModel.state.movie!)

                CastSection(cast: viewModel.cast)

                RecommendationSection(
                    state: viewModel.recommendations,
                    onLoadMore: { await viewModel.loadRecommendations() }
                )

                Spacer()
            }
            .padding()
        }
    }
}

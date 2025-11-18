//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject var viewModel: MovieDetailViewModel

    init(viewModel: MovieDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
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
    }

    private var detailContent: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                MovieDetailHeader(movie: viewModel.state.movie!)

                MovieDetailInfoSection(movie: viewModel.state.movie!)

                CastSection(cast: viewModel.cast)

                Spacer()
            }
            .padding()
        }
    }
}

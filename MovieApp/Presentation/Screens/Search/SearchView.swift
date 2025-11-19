//
//  SearchView.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel
    private let diContainer: AppDIContainer

    init(viewModel: SearchViewModel, diContainer: AppDIContainer) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.diContainer = diContainer
    }
    var body: some View {
        VStack(spacing: 16) {
            SearchBar(text: $viewModel.query) { text in
                viewModel.onQueryChange(text)
            }
            content
        }
        .navigationTitle("Search")
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state.status {
        case .idle:
            idleView
        case .loadingInitial:
            loadingView
        case .loadingMore, .loaded:
            SearchResultsView(
                state: viewModel.state,
                onLoadMore: {
                    await viewModel.loadNextPage()
                },
                diContainer: diContainer
            )
        case .error(let message):
            errorView(message)
        }
    }

    var idleView: some View {
        VStack {
            Spacer()
            Text("Type something to search…")
                .foregroundColor(.gray)
            Spacer()
        }
    }

    var loadingView: some View {
        VStack {
            Spacer()
            ProgressView("Searching…")
            Spacer()
        }
    }

    private func errorView(_ message: String) -> some View {
        VStack {
            Text("Error: \(message)")
                .foregroundColor(.red)

            Button("Retry") {
                Task { await viewModel.performSearch()}
            }
        }
        .padding(.top, 100)
    }
}

//
//  FavoritesView.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesStore: FavoritesStore
    let diContainer: AppDIContainer

    var body: some View {
        Group {
            if favoritesStore.favorites.isEmpty {
                ContentUnavailableView("No Favorites", systemImage: "star")
            } else  {
                ScrollView {
                    LazyVGrid(columns: [.init(.flexible()), .init(.flexible())], spacing: 20) {
                        ForEach(favoritesStore.favorites) { movie in
                            NavigationLink {
                                MovieDetailView(movieID: movie.id, diContainer: diContainer)
                            } label: {
                                FavoriteCard(movie: movie)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Favorites")
        .task { await favoritesStore.load() }
    }
}

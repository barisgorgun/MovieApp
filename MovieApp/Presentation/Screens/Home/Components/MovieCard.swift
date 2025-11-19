//
//  MovieCard.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import SwiftUI

struct MovieCard: View {
    let movie: Movie
    @EnvironmentObject var favoritesStore: FavoritesStore

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                CachedAsyncImage(url: movie.posterURL)
                    .frame(width: 130, height: 180)
                    .cornerRadius(12)

                Button {
                    Task {
                        await favoritesStore.toggle(movie: movie.toFavoriteMovie())
                    }
                } label: {
                    Image(systemName: favoritesStore.isFavorite(movie.id) ? "heart.fill" : "heart")
                        .padding(6)
                        .foregroundColor(.red)
                        .background(Color.white.opacity(0.7))
                        .clipShape(Circle())
                        .padding(6)
                }
            }
            Text(movie.title)
                .font(.caption)
                .foregroundColor(.primary)
                .lineLimit(1)
        }
        .frame(width: 130)
    }
}

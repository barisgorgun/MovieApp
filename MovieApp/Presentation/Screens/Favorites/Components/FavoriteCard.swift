//
//  FavoriteCard.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import SwiftUI

struct FavoriteCard: View {
    let movie: FavoriteMovie
    @EnvironmentObject var favoritesStore: FavoritesStore

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                CachedAsyncImage(url: movie.posterURL)
                    .frame(height: 220)
                    .cornerRadius(12)

                Button {
                    Task {
                        await favoritesStore.toggle(movie: movie)
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

            Text(movie.name)
                .font(.callout)
                .lineLimit(2)
        }
    }
}

//
//  SearchMovieCard.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import SwiftUI

struct SearchMovieCard: View {
    let movie: Movie

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            CachedAsyncImage(url: movie.posterURL)
                .frame(height: 220)
                .cornerRadius(12)

            Text(movie.title)
                .font(.callout)
                .foregroundColor(.primary)
                .lineLimit(2)

            HStack(spacing: 4) {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.caption)

                Text("\(movie.voteAverage, specifier: "%.1f")")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

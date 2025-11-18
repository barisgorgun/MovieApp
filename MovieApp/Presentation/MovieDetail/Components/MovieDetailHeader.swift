//
//  MovieDetailHeader.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import SwiftUI

struct MovieDetailHeader: View {
    let movie: MovieDetail

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            CachedAsyncImage(url: movie.posterURL)
                .scaledToFill()
                .frame(height: 420)
                .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.7)],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 200)
            .frame(maxHeight: .infinity, alignment: .bottom)

            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                if let tagline = movie.tagline, !tagline.isEmpty {
                    Text(tagline)
                        .font(.headline)
                        .foregroundColor(.white.opacity(0.8))
                        .italic()
                }

                HStack(spacing: 12) {
                    Label("\(movie.voteAverage, specifier: "%.1f")", systemImage: "star.fill")
                        .foregroundColor(.yellow)

                    if let release = movie.releaseDate {
                        Text(release.formattedDateString)
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                .font(.subheadline)
            }
            .padding()
        }
        .cornerRadius(16)
        .padding(.bottom, 8)
    }
}

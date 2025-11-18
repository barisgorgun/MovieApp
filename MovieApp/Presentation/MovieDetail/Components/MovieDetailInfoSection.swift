//
//  MovieDetailInfoSection.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import SwiftUI

struct MovieDetailInfoSection: View {
    let movie: MovieDetail

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            overviewSection

            Divider().padding(.vertical, 4)

            genresSection

            if let runtime = movie.runtime {
                runTimeSection(runtime)
            }

            if let releaseDate = movie.releaseDate {
                releaseDateSection(releaseDate)
            }

            ratingSection
        }
    }

    private var overviewSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Overview")
                .font(.headline)

            Text(movie.overview)
                .font(.body)
                .foregroundColor(.secondary)
        }
    }

    private var genresSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Genres")
                .font(.headline)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(movie.genres) { genre in
                        Text(genre.name)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.blue.opacity(0.15))
                            .cornerRadius(12)
                    }
                }
            }
        }

    }

    private func runTimeSection(_ minutes: Int) -> some View {
        HStack {
            Text("Runtime:")
                .font(.headline)

            Text("\(minutes) min")
                .foregroundColor(.secondary)
        }
    }

    private func releaseDateSection(_ dateString: String) -> some View {
        HStack {
            Text("Release")
                .font(.headline)

            Text(dateString.formattedDateString)
                .foregroundColor(.secondary)
        }
    }

    private var ratingSection: some View {
        HStack(spacing: 8) {
            Text("Rating")
                .font(.headline)

            Label("\(movie.voteAverage, specifier: "%.1f")", systemImage: "star.fill")
                .foregroundColor(.yellow)
        }
    }
}

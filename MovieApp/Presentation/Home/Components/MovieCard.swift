//
//  MovieCard.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import SwiftUI

struct MovieCard: View {
    let movie: Movie

    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: movie.posterURL) { img in
                img.resizable()
            } placeholder: {
                Rectangle().fill(Color.gray.opacity(0.3))
            }
            .frame(width: 130, height: 180)
            .cornerRadius(12)

            Text(movie.title)
                .font(.caption)
                .foregroundColor(.primary)
                .lineLimit(1)
        }
        .frame(width: 130)
    }
}

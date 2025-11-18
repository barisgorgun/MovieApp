//
//  CastCard.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import SwiftUI

struct CastCard: View {
    let actor: Cast

    var body: some View {
        VStack(alignment: .center, spacing: 8) {

            CachedAsyncImage(url: actor.profileURL) {
                Circle().fill(Color.gray.opacity(0.3))
            }
            .scaledToFill()
            .frame(width: 80, height: 80)
            .clipShape(Circle())

            Text(actor.name)
                .font(.caption)
                .lineLimit(1)

            Text(actor.character)
                .font(.caption2)
                .foregroundColor(.secondary)
                .lineLimit(1)
        }
        .frame(width: 90)
    }
}

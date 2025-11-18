//
//  CastSection.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import SwiftUI

struct CastSection: View {
    let cast: [Cast]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Cast")
                .font(.headline)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(cast) { actor in
                        CastCard(actor: actor)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

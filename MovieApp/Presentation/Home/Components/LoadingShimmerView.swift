//
//  LoadingShimmerView.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import SwiftUI

struct LoadingShimmerView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(0..<5) { _ in
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 130, height: 200)
                        .shimmering()
                }
            }
        }
    }
}

#Preview {
    LoadingShimmerView()
}

extension View {
    func shimmering() -> some View {
        self
            .redacted(reason: .placeholder)
    }
}

//
//  ErrorView.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    let onRetry: () async -> Void

    var body: some View {
        HStack {
            Text("Error: \(message)")
                .foregroundColor(.red)

            Button("Retry") {
                Task { await onRetry() }
            }
        }
        .padding(.vertical, 16)
    }
}

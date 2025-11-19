//
//  SearchBar.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var placeHolder = "Search movies…"
    var onTextChanged: (String) -> Void

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField(placeHolder, text: $text)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                .onChange(of: text) { newValue in
                    onTextChanged(newValue)
                }

            if !text.isEmpty {
                Button {
                    text = ""
                    onTextChanged("")
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemGray5))
        )
        .padding(.horizontal)
    }
}

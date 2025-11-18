//
//  CachedAsyncImage.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import SwiftUI

struct CachedAsyncImage: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: AnyView

    init(
        url: URL?,
        cache: ImageCacheActor = AppImageCache.shared,
        @ViewBuilder placeholder: @escaping () -> some View = {
            Rectangle().fill(Color.gray.opacity(0.3))
        }
    ) {
        _loader = StateObject(wrappedValue: ImageLoader(url: url, cache: cache))
        self.placeholder = AnyView(placeholder())
    }

    var body: some View {
        content
            .animation(.default, value: loader.image)
    }

    @ViewBuilder
    private var content: some View {
        if let image = loader.image {
            Image(uiImage: image)
                .resizable()
        } else {
            placeholder
        }
    }
}

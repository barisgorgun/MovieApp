//
//  ImageLoader.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import SwiftUI
import UIKit
import Combine

@MainActor
final class ImageLoader: ObservableObject {

    @Published var image: UIImage?

    private let cache: ImageCacheActor
    private let downloader = ImageDownloader()

    init(url: URL?, cache: ImageCacheActor = AppImageCache.shared) {
        self.cache = cache
        load(url: url)
    }

    func load(url: URL?) {
        guard let url else { return }

        Task {
            if let cached = await cache.get(url) {
                self.image = cached
                return
            }

            guard let downloaded = try? await downloader.fetch(url: url) else {
                return
            }

            await cache.set(url, image: downloaded)

            self.image = downloaded
        }
    }
}


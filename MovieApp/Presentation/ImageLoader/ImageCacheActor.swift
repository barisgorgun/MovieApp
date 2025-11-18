//
//  ImageCacheActor.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import UIKit

actor ImageCacheActor {
    private let cache = NSCache<NSURL, UIImage>()

    func get(_ url: URL) -> UIImage? {
        cache.object(forKey: url as NSURL)
    }

    func set(_ url: URL, image: UIImage) {
        cache.setObject(image, forKey: url as NSURL)
    }
}

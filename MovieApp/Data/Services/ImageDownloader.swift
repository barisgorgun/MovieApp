//
//  ImageDownloader.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import UIKit

struct ImageDownloader {
    
    func fetch(url: URL) async throws -> UIImage? {
        let (data, _) = try await URLSession.shared.data(from: url)
        return UIImage(data: data)
    }
}

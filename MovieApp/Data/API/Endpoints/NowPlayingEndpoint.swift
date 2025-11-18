//
//  NowPlayingEndpoint.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

struct NowPlayingEndpoint: Endpoint {
    let page: Int

    var path: String { "/movie/now_playing" }

    var queryItems: [URLQueryItem] {
        [
            URLQueryItem(name: "page", value: "\(page)")
        ]
    }
}

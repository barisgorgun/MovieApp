//
//  PopularEndpoint.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

struct PopularEndpoint: Endpoint {
    let page: Int

    var path: String { "/movie/popular" }

    var queryItems: [URLQueryItem] {
        [
            URLQueryItem(name: "page", value: "\(page)")
        ]
    }
}

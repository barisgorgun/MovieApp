//
//  SearchMoviesEndpoint.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

struct SearchMoviesEndpoint: Endpoint {
    let query: String
    let page: Int

    var path: String { "/search/movie" }

    var queryItems: [URLQueryItem] {
        [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "page", value: "\(page)")
        ]
    }
}

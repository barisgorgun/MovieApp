//
//  TopRatedEndpoint.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

struct TopRatedEndpoint: Endpoint {
    let page: Int

    var path: String { "/movie/top_rated" }

    var queryItems: [URLQueryItem] {
        [
            URLQueryItem(name: "page", value: "\(page)")
        ]
    }
}

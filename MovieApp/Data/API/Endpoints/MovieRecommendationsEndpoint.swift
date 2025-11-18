//
//  MovieRecommendationsEndpoint.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

struct MovieRecommendationsEndpoint: Endpoint {
    let movieID: Int
    let page: Int

    var path: String {
        "/movie/\(movieID)/recommendations"
    }

    var queryItems: [URLQueryItem] {
        [
            URLQueryItem(name: "page", value: "\(page)")
        ]
    }
}

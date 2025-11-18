//
//  MovieCreditsEndpoint.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

struct MovieCreditsEndpoint: Endpoint {
    let id: Int

    var path: String { "/movie/\(id)/credits" }

    var queryItems: [URLQueryItem] { [] }
}

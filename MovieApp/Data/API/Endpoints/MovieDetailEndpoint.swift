//
//  MovieDetailEndpoint.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

struct MovieDetailEndpoint: Endpoint {
    let id: Int

    var path: String { "/movie/\(id)" }

    var queryItems: [URLQueryItem] { [] }
}

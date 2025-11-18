//
//  Endpoint.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: String { get }
    var queryItems: [URLQueryItem] { get }

    func makeURL() -> URL?
}

extension Endpoint {

    var baseURL: String {
        "https://api.themoviedb.org/3"
    }

    var method: String {
        "GET"
    }

    func makeURL() -> URL? {
        var urlComponents = URLComponents(string: baseURL + path)
        urlComponents?.queryItems = queryItems
        return urlComponents?.url
    }
}

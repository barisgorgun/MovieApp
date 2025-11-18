//
//  MoviePage.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

struct MoviePage {
    let movies: [Movie]
    let page: Int
    let totalPages: Int

    var canLoadMore: Bool { page < totalPages }
}

//
//  MovieListState.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

enum ListStatus: Equatable {
    case idle
    case loadingInitial
    case loaded
    case loadingMore
    case error(String)
}

struct MovieListState: Equatable {
    var movies: [Movie] = []
    var status: ListStatus = .idle
    var page: Int = 1
    var canLoadMore: Bool = true
}

//
//  MovieDetailState.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

struct MovieDetailState {
    var status: Status = .idle
    var movie: MovieDetail?

    enum Status {
        case idle
        case loading
        case loaded
        case error(String)
    }
}

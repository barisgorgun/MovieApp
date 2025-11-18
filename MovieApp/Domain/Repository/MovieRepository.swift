//
//  MovieRepository.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//


protocol MovieRepository {
    func fetchTopRated(page: Int) async throws -> MoviePage
    func fetchPopular(page: Int) async throws -> MoviePage
    func fetchNowPlaying(page: Int) async throws -> MoviePage
    func searchMovies(query: String) async throws -> MoviePage
    func fetchDetail(id: Int) async throws -> MovieDetail
}

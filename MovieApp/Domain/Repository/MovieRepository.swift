//
//  MovieRepository.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//


protocol MovieRepository {
    func fetchTopRated(page: Int) async throws -> [Movie]
    func fetchPopular(page: Int) async throws -> [Movie]
    func fetchNowPlaying(page: Int) async throws -> [Movie]
    func searchMovies(query: String) async throws -> [Movie]
    func fetchDetail(id: Int) async throws -> MovieDetail
}

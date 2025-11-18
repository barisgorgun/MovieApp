//
//  MovieRepositoryImpl.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

final class MovieRepositoryImpl: MovieRepository {
    private let apiService: APIService

    init(apiService: APIService) {
        self.apiService = apiService
    }

    func fetchTopRated(page: Int) async throws -> MoviePage {
        let dto: MovieListResponseDTO = try await apiService.request(TopRatedEndpoint(page: page))
        return dto.toDomain()
    }
    
    func fetchPopular(page: Int) async throws -> MoviePage {
        let dto: MovieListResponseDTO = try await apiService.request(PopularEndpoint(page: page))
        return dto.toDomain( )
    }
    
    func fetchNowPlaying(page: Int) async throws -> MoviePage {
        let dto: MovieListResponseDTO = try await apiService.request(NowPlayingEndpoint(page: page))
        return dto.toDomain( )
    }
    
    func searchMovies(query: String) async throws -> MoviePage {
        let dto: MovieListResponseDTO = try await apiService.request(SearchMoviesEndpoint(query: query))
        return dto.toDomain()
    }
    
    func fetchDetail(id: Int) async throws -> MovieDetail {
        let detailDTO: MovieDetailDTO = try await apiService.request(MovieDetailEndpoint(id: id))
        let creditDTO: CreditsResponseDTO = try await apiService.request(MovieCreditsEndpoint(id: id))

        let cast = creditDTO.toDomain()
        return detailDTO.toDomain(cast: cast)
    }

    func fetchMovieCredits(id: Int) async throws -> [Cast] {
        let endPoint = MovieCreditsEndpoint(id: id)
        let creditDTO: CreditsResponseDTO = try await apiService.request(endPoint)
        return creditDTO.toDomain()
    }

    func fetchRecommendations(movieID: Int, page: Int) async throws -> MoviePage {
        let endPoint = MovieRecommendationsEndpoint(movieID: movieID, page: page)
        let recommendationsDTO: MovieListResponseDTO = try await apiService.request(endPoint)

        return recommendationsDTO.toDomain()
    }
}

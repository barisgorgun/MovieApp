//
//  APIError.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//


enum APIError: Error {
    case invalidURL
    case requestFailed
    case decodingFailed
    case unauthorized
    case notFound
    case serverError
    case unknown
}

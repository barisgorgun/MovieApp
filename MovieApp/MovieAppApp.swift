//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import SwiftUI

@main
struct MovieAppApp: App {
    private let diContainer: AppDIContainer

    init() {
            let apiService = APIServiceImpl()
            let movieRepository = MovieRepositoryImpl(apiService: apiService)

            self.diContainer = AppDIContainer(movieRepository: movieRepository)
        }

    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: diContainer.makeHomeViewModel(), diContainer: diContainer)
        }
    }
}

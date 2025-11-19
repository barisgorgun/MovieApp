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
    @StateObject private var favoritesStore: FavoritesStore

    init() {
            let apiService = APIServiceImpl()
            let movieRepository = MovieRepositoryImpl(apiService: apiService)

            self.diContainer = AppDIContainer(movieRepository: movieRepository)
            let store = diContainer.makeFavoritesStore()
        _favoritesStore = StateObject(wrappedValue: store)
        }

    var body: some Scene {
        WindowGroup {
            MainTabView(diContainer: diContainer)
                .environmentObject(favoritesStore)
                .task {
                    await favoritesStore.load()
                }
        }
    }
}

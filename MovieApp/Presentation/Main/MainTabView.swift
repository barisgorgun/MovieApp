//
//  MainTabView.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 19.11.2025.
//

import SwiftUI

struct MainTabView: View {

    private let diContainer: AppDIContainer

    init(diContainer: AppDIContainer) {
        self.diContainer = diContainer
    }

    var body: some View {
        TabView {
            NavigationStack {
                HomeView(viewModel: diContainer.makeHomeViewModel(), diContainer: diContainer)
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }

            NavigationStack {
                SearchView(viewModel: diContainer.makeSearchViewModel(), diContainer: diContainer)
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }

            NavigationStack {
                Text("Favorites Coming Soon")
            }
            .tabItem {
                Label("Favorites", systemImage: "star.fill")
            }
        }
    }
}

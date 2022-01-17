//
//  AppCoordinatorView.swift
//  SimpleNavigation
//
//  Created by Erik Lopez on 2022/01/05.
//

import SwiftUI

struct AppCoordinatorView: View {
    @ObservedObject var coordinator: AppCoordinator
    
    var body: some View {
        TabView {
            NavigationView {
                FeedCoordinatorView(coordinator: coordinator.viewModel(for: .homeFeedCoordinator))
            }
            .tabItem {
                Label("app.tab.feed", systemImage: "house")
            }
            .navigationViewStyle(.stack)
            NavigationView {
                FeedCoordinatorView(coordinator: coordinator.viewModel(for: .musicFeedCoordinator))
            }
            .tabItem {
                Label("app.tab.music", systemImage: "music.note.list")
            }
            .navigationViewStyle(.stack)
            NavigationView {
                AccountCoordinatorView(coordinator: coordinator.viewModel(for: .accountCoordinator))
            }
            .tabItem {
                Label("app.tab.account", systemImage: "person")
            }
            .navigationViewStyle(.stack)
        }
    }
}

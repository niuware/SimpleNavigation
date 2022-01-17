//
//  AppCoordinator.swift
//  SimpleNavigation
//
//  Created by Erik Lopez on 2022/01/06.
//

import Foundation

enum AppCoordinatorNavigation {
    case homeFeedCoordinator
    case musicFeedCoordinator
    case accountCoordinator
}

final class AppCoordinator: Coordinator {
    @Published var navigationStack: [(AppCoordinatorNavigation, Any)] = []
    
    init() {
        pushToNavigationStack(.homeFeedCoordinator, viewModel: FeedCoordinator(feed: .home))
        pushToNavigationStack(.musicFeedCoordinator, viewModel: FeedCoordinator(feed: .music))
        pushToNavigationStack(.accountCoordinator, viewModel: AccountCoordinator())
    }
}

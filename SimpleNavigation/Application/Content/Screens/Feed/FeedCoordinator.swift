//
//  FeedCoordinator.swift
//  SimpleNavigation
//
//  Created by Erik Lopez on 2022/01/05.
//

import Foundation

enum FeedCoordinatorNavigation {
    case feed
    case item
}

final class FeedCoordinator: Coordinator {
    @Published var navigationStack: [(FeedCoordinatorNavigation, Any)] = []
    
    init(feed: Feed) {
        let viewModel = FeedViewModel(feed: feed)
        viewModel.onNavigation = { [weak self] navigation in
            switch navigation {
            case .selectItem(let itemId):
                self?.pushItemCoordinator(itemId)
            }
        }
        pushToNavigationStack(.feed, viewModel: viewModel)
    }
    
    private func pushItemCoordinator(_ itemId: ItemId) {
        let coordinator = ItemCoordinator(itemId: itemId)
        coordinator.onFinish = { [weak self] in
            self?.popFromNavigationStack()
        }
        pushToNavigationStack(.item, viewModel: coordinator)
    }
}

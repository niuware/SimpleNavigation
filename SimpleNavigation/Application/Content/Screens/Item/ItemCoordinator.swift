//
//  ItemCoordinator.swift
//  SimpleNavigation
//
//  Created by Erik Lopez on 2022/01/05.
//

import Foundation

enum ItemCoordinatorNavigation {
    case item
    case details
}

final class ItemCoordinator: Coordinator {
    @Published var navigationStack: [(ItemCoordinatorNavigation, Any)] = []
    
    var onFinish: (() -> Void)!
    
    init(itemId: ItemId) {
        let viewModel = ItemViewModel(itemId: itemId)
        viewModel.onNavigation = { [weak self] navigation in
            switch navigation {
            case .back:
                self?.onFinish()
            case .more:
                self?.pushItemDetails()
            }
        }
        pushToNavigationStack(.item, viewModel: viewModel)
    }
    
    func popItemDetails() {
        popFromNavigationStack()
    }
    
    private func pushItemDetails() {
        let viewModel = ItemDetailsViewModel()
        pushToNavigationStack(.details, viewModel: viewModel)
    }
}

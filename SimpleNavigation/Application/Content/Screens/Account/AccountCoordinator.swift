//
//  AccountCoordinator.swift
//  SimpleNavigation
//
//  Created by Erik Lopez on 2022/01/05.
//

import Foundation

enum AccountCoordinatorNavigation {
    case account
    case accountEdit
    case accountConfirm
    case itemCoordinator
}

final class AccountCoordinator: Coordinator {
    @Published var navigationStack: [(AccountCoordinatorNavigation, Any)] = []
    
    init() {
        let viewModel = AccountViewModel()
        viewModel.onNavigation = { [weak self] navigation in
            switch navigation {
            case .selectItem(let itemId):
                self?.pushItemCoordinator(itemId)
            case .edit:
                self?.pushAccountEditView()
            }
        }
        pushToNavigationStack(.account, viewModel: viewModel)
    }
    
    private func pushAccountEditView() {
        let viewModel = AccountEditViewModel()
        viewModel.onNavigation = { [weak self] navigation in
            switch navigation {
            case .cancel:
                self?.popFromNavigationStack()
            case let .confirm(name, username):
                self?.pushAccountConfirmView(name: name, username: username)
            }
        }
        pushToNavigationStack(.accountEdit, viewModel: viewModel)
    }
    
    private func pushAccountConfirmView(name: String, username: String) {
        let viewModel = AccountConfirmViewModel(name: name, username: username)
        viewModel.onNavigation = { [weak self] navigation in
            switch navigation {
            case .back:
                self?.popFromNavigationStack()
            case .complete:
                // Pop twice
                self?.popFromNavigationStack()
                self?.popFromNavigationStack()
            }
        }
        pushToNavigationStack(.accountConfirm, viewModel: viewModel)
    }
    
    private func pushItemCoordinator(_ itemId: ItemId) {
        let coordinator = ItemCoordinator(itemId: itemId)
        coordinator.onFinish = { [weak self] in
            self?.popFromNavigationStack()
        }
        pushToNavigationStack(.itemCoordinator, viewModel: coordinator)
    }
}

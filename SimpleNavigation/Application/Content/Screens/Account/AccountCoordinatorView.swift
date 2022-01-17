//
//  AccountCoordinatorView.swift
//  SimpleNavigation
//
//  Created by Erik Lopez on 2022/01/05.
//

import SwiftUI

struct AccountCoordinatorView: View {
    @ObservedObject var coordinator: AccountCoordinator
    
    var body: some View {
        ZStack {
            AccountView(viewModel: coordinator.viewModel(for: .account))
            LazyNavigationLink(
                isActive: coordinator.isActive(.accountEdit),
                destination: {
                    AccountEditView(viewModel: coordinator.viewModel(for: .accountEdit))
                    LazyNavigationLink(
                        isActive: coordinator.isActive(.accountConfirm),
                        destination: {
                            AccountConfirmView(viewModel: coordinator.viewModel(for: .accountConfirm))
                        })
                })
            LazyNavigationLink(
                isActive: coordinator.isActive(.itemCoordinator),
                destination: {
                    ItemCoordinatorView(coordinator: coordinator.viewModel(for: .itemCoordinator))
                })
        }
    }
}

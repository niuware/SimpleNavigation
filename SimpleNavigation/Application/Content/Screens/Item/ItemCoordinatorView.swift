//
//  ItemCoordinatorView.swift
//  SimpleNavigation
//
//  Created by Erik Lopez on 2022/01/05.
//

import SwiftUI

struct ItemCoordinatorView: View {
    @ObservedObject var coordinator: ItemCoordinator
    
    var body: some View {
        Group {
            ItemView(viewModel: coordinator.viewModel(for: .item))
        }
        .sheet(
            isPresented: coordinator.isActive(.details),
            onDismiss: {
                coordinator.popItemDetails()
            },
            content: {
                ItemDetailsView(viewModel: coordinator.viewModel(for: .details))
            })
    }
}

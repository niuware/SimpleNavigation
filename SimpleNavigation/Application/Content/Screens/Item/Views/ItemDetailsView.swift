//
//  ItemDetailsView.swift
//  SimpleNavigation
//
//  Created by Erik Lopez on 2022/01/11.
//

import SwiftUI

struct ItemDetailsView: View {
    @ObservedObject var viewModel: ItemDetailsViewModel
    
    var body: some View {
        Text(viewModel.details)
    }
}

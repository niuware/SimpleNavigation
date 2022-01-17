//
//  FeedView.swift
//  SimpleNavigation
//
//  Created by Erik Lopez on 2022/01/05.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel: FeedViewModel
    
    private let columns: [GridItem] = [.init(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.data, id: \.self) { itemId in
                    FeedItemView(title: itemId)
                        .padding(.bottom)
                        .onTapGesture {
                            viewModel.showItem(itemId)
                        }
                }
            }
        }
        .navigationTitle("\(viewModel.title)")
    }
}

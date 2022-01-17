//
//  ItemView.swift
//  SimpleNavigation
//
//  Created by Erik Lopez on 2022/01/05.
//

import SwiftUI

struct ItemView: View {
    @ObservedObject var viewModel: ItemViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .fill(Color.gray)
                .frame(height: 400)
            Group {
                Text(viewModel.itemDescription)
                Button("item.more", action: viewModel.more)
            }
            .padding()
            Spacer()
        }
        .navigationTitle(viewModel.itemName)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading, content: {
                Button(action: viewModel.back) {
                    Image(systemName: "chevron.backward")
                }
            })
        }
    }
}

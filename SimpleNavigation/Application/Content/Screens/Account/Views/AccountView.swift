//
//  AccountView.swift
//  SimpleNavigation
//
//  Created by Erik Lopez on 2022/01/05.
//

import SwiftUI

struct AccountView: View {
    @ObservedObject var viewModel: AccountViewModel
    
    var body: some View {
        Form {
            Section(content: {
                HStack {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 100, height: 100)
                    VStack(alignment: .leading) {
                        Text(viewModel.name)
                            .font(.headline)
                        Text(viewModel.username)
                            .font(.subheadline)
                        Button("Edit", action: viewModel.edit)
                    }
                }
            }, header: {
                Text("account.header.default")
            })
            Section(content: {
                Button(action: {
                    viewModel.selectItem("Item One")
                }, label: {
                    Text("Item One")
                })
                Button(action: {
                    viewModel.selectItem("Item Two")
                }, label: {
                    Text("Item Two")
                })
            }, header: {
                Text("account.header.favorites")
            })
        }
        .navigationBarHidden(true)
    }
}

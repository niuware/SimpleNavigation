//
//  AccountEditView.swift
//  SimpleNavigation
//
//  Created by Erik Lopez on 2022/01/11.
//

import SwiftUI

struct AccountEditView: View {
    @ObservedObject var viewModel: AccountEditViewModel
    
    var body: some View {
        Form {
            TextField(LocalizedStringKey("account.edit.name"), text: $viewModel.name)
            TextField(LocalizedStringKey("account.edit.username"), text: $viewModel.username)
        }
        .navigationTitle("account.edit.title")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading, content: {
                Button(action: viewModel.cancel) {
                    Image(systemName: "chevron.backward")
                }
            })
            ToolbarItem(placement: .navigationBarTrailing, content: {
                Button(action: viewModel.confirm) {
                    Text("account.edit.confirm")
                }
            })
        }
    }
}

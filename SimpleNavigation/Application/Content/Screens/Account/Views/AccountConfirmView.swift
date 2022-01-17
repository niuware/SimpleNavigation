//
//  AccountConfirmView.swift
//  SimpleNavigation
//
//  Created by Erik Lopez on 2022/01/11.
//

import SwiftUI

struct AccountConfirmView: View {
    @ObservedObject var viewModel: AccountConfirmViewModel
    
    var body: some View {
        Form {
            Text(viewModel.name)
            Text(viewModel.username)
        }
        .navigationTitle("account.confirm.title")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading, content: {
                Button(action: viewModel.back) {
                    Image(systemName: "chevron.backward")
                }
            })
            ToolbarItem(placement: .navigationBarTrailing, content: {
                Button(action: viewModel.complete) {
                    Text("account.confirm.complete")
                }
            })
        }
    }
}

//
//  AccountEditViewModel.swift
//  SimpleNavigation
//
//  Created by Erik Lopez on 2022/01/11.
//

import Foundation

enum AccountEditNavigation: Equatable {
    case cancel
    case confirm(name: String, username: String)
}

final class AccountEditViewModel: ObservableObject, Navigable {
    @Published var name: String = ""
    @Published var username: String = ""
    
    var onNavigation: ((AccountEditNavigation) -> Void)!
    
    func cancel() {
        onNavigation(.cancel)
    }
    
    func confirm() {
        onNavigation(.confirm(name: name, username: username))
    }
}

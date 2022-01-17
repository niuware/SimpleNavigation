//
//  AccountConfirmViewModel.swift
//  SimpleNavigation
//
//  Created by Erik Lopez on 2022/01/11.
//

import Foundation

enum AccountConfirmNavigation {
    case back
    case complete
}

final class AccountConfirmViewModel: ObservableObject, Navigable {
    let name: String
    let username: String
    var onNavigation: ((AccountConfirmNavigation) -> Void)!
    
    init(name: String, username: String) {
        self.name = name
        self.username = username
    }
    
    func back() {
        onNavigation(.back)
    }
    
    func complete() {
        onNavigation(.complete)
    }
}

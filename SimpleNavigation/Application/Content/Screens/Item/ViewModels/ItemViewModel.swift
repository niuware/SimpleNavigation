//
//  ItemViewModel.swift
//  SimpleNavigation
//
//  Created by Erik Lopez on 2022/01/05.
//

import Foundation

enum ItemNavigation {
    case back
    case more
}

final class ItemViewModel: ObservableObject, Navigable {
    let itemName: String
    let itemDescription = "A view that pads this view inside the specified edge insets with a system-calculated amount of padding."
    var onNavigation: ((ItemNavigation) -> Void)!
    
    init(itemId: ItemId) {
        itemName = "\(itemId)"
    }
    
    func back() {
        onNavigation(.back)
    }
    
    func more() {
        onNavigation(.more)
    }
}

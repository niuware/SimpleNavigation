//
//  FeedViewModel.swift
//  SimpleNavigation
//
//  Created by Erik Lopez on 2022/01/05.
//

import Foundation

enum FeedNavigation: Equatable {
    case selectItem(ItemId)
}

final class FeedViewModel: ObservableObject, Navigable {
    lazy var data: [String] = {
        switch feed {
        case .home:
            return [
                "Item One",
                "Item Two",
                "Item Three",
                "Item Four",
                "Item Five",
                "Item Six"
            ]
        case .music:
            return [
                "Track One",
                "Track Two",
                "Track Three"
            ]
        }
    }()
    
    var title: String {
        return feed.rawValue
    }
    
    var onNavigation: ((FeedNavigation) -> Void)!
    
    private let feed: Feed
    
    init(feed: Feed) {
        self.feed = feed
    }
    
    func showItem(_ itemId: ItemId) {
        onNavigation(.selectItem(itemId))
    }
}

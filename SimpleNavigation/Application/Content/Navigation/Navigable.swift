//
//  Navigable.swift
//  SimpleNavigation
//
//  Created by Erik Lopez on 2022/01/11.
//

import Foundation

protocol Navigable {
    associatedtype NavigationItem: Equatable
    
    var onNavigation: ((NavigationItem) -> Void)! { get }
}

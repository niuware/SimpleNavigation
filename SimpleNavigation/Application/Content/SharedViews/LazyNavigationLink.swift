//
//  LazyNavigationLink.swift
//  SimpleNavigation
//
//  Created by Erik Lopez on 2022/01/12.
//

import SwiftUI

struct LazyNavigationLink<Destination>: View where Destination: View {
    let isActive: Binding<Bool>
    @ViewBuilder let destination: () -> Destination
    
    var body: some View {
        NavigationLink(
            isActive: isActive,
            destination: {
                LazyLoadView(destination())
            },
            label: {
                EmptyView()
            })
    }
}

//
//  FeedItemView.swift
//  SimpleNavigation
//
//  Created by Erik Lopez on 2022/01/05.
//

import SwiftUI

struct FeedItemView: View {
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "circle.dashed")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 30)
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                    Text(title)
                        .font(.subheadline)
                }
            }
            .padding(5)
            Rectangle()
                .fill(Color.gray)
                .frame(height: 250)
        }
    }
}

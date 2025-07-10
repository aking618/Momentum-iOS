//
//  StatTile.swift
//  MomentumUI
//
//  Created by Ayren King on 7/9/25.
//

import SwiftUI

public struct StatTile: View {
    let title: String
    let value: String

    public init(title: String, value: String) {
        self.title = title
        self.value = value
    }

    public var body: some View {
        Card {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.caption)
                    .foregroundStyle(Color.textSecondary)
                Text(value)
                    .font(.title3).bold()
                    .foregroundStyle(Color.textPrimary)
            }
        }
    }
}


#Preview {
    StatTile(title: "5K", value: "21:20")
}

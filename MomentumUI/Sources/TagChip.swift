//
//  TagChip.swift
//  MomentumUI
//
//  Created by Ayren King on 7/9/25.
//

import SwiftUI

public struct TagChip: View {
    let title: String
    let isSelected: Bool

    public init(title: String, isSelected: Bool) {
        self.title = title
        self.isSelected = isSelected
    }

    public var body: some View {
        Text(title)
            .font(.caption)
            .foregroundStyle(isSelected ? Color.white : Color.textSecondary)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(
                Capsule().fill(isSelected ? Color.primaryBlue : Color.border)
            )
    }
}

#Preview {
    Card {
        VStack {
            Text("TAG CHIP")
                .font(.headline)
            HStack {
                TagChip(title: "Running", isSelected: false)
                TagChip(title: "Running", isSelected: true)
            }
        }
    }
}

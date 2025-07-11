//
//  BadgeView.swift
//  MomentumUI
//
//  Created by Ayren King on 7/9/25.
//

import SwiftUI

public struct BadgeView: View {
    let label: String
    let icon: String

    public init(label: String, icon: String) {
        self.label = label
        self.icon = icon
    }

    public var body: some View {
        HStack(spacing: 6) {
            Text(icon)
            Text(label)
                .font(.caption)
                .foregroundStyle(Color.textSecondary)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 4)
        .background(Capsule().fill(Color.accentGreen.opacity(0.1)))
    }
}

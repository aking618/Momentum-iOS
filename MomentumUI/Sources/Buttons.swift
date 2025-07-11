//
//  Buttons.swift
//  MomentumUI
//
//  Created by Ayren King on 7/6/25.
//

import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(!configuration.isPressed ? Color.buttonPrimary : Color.buttonPrimary.opacity(0.5))
            .font(.system(size: 16, weight: .medium))
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isEnabled ? Color.primaryBlue : Color.gray.opacity(0.3))
                    .stroke(Color.border)
            )
    }
}

public struct SecondaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    @Environment(\.colorScheme) var colorScheme

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(
                !isEnabled ? Color.buttonPrimary.opacity(0.75) :
                !configuration.isPressed ? Color.buttonSecondary : .buttonSecondary.opacity(0.5)
            )
            .font(.system(size: 16, weight: .medium))
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isEnabled ? Color.background :
                            colorScheme == .light ? Color.gray.opacity(0.3) : Color.white.opacity(0.3)
                         )
                    .stroke(Color.border)
            )
    }
}

extension ButtonStyle where Self == PrimaryButtonStyle {
    public static var primary: PrimaryButtonStyle { .init() }
}

extension ButtonStyle where Self == SecondaryButtonStyle {
    public static var secondary: SecondaryButtonStyle { .init() }
}

#Preview {
    HStack {
        VStack {
            Button("Primary") {}
                .buttonStyle(.primary)
            Button("Primary") {}
                .buttonStyle(.primary)
                .disabled(true)
        }

        VStack {
            Button("Secondary") {}
                .buttonStyle(.secondary)
            Button("Secondary") {}
                .buttonStyle(.secondary)
                .disabled(true)
        }
    }
}

//
//  Colors.swift
//  MomentumUI
//
//  Created by Ayren King on 7/9/25.
//

import SwiftUI

public extension Color {
    static let accentGreen = MomentumUIAsset.accentGreen.swiftUIColor
    static let background = MomentumUIAsset.background.swiftUIColor
    static let border = MomentumUIAsset.border.swiftUIColor
    static let buttonPrimary = MomentumUIAsset.buttonPrimary.swiftUIColor
    static let buttonSecondary = MomentumUIAsset.buttonSecondary.swiftUIColor
    static let error = MomentumUIAsset.error.swiftUIColor
    static let primaryBlue = MomentumUIAsset.primaryBlue.swiftUIColor
    static let progressFill = MomentumUIAsset.progressFill.swiftUIColor
    static let surface = MomentumUIAsset.surface.swiftUIColor
    static let textPrimary = MomentumUIAsset.textPrimary.swiftUIColor
    static let textSecondary = MomentumUIAsset.textSecondary.swiftUIColor
}

extension Bundle {
    static var current: Bundle {
        class __ {}
        return Bundle(for: __.self)
    }
}

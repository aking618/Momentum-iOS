//
//  Colors.swift
//  MomentumUI
//
//  Created by Ayren King on 7/9/25.
//

import SwiftUI

public extension Color {
    static let accentGreen = Color("accentGreen", bundle: .current)
    static let background = Color("background", bundle: .current)
    static let border = Color("border", bundle: .current)
    static let buttonPrimary = Color("buttonPrimary", bundle: .current)
    static let buttonSecondary = Color("buttonSecondary", bundle: .current)
    static let error = Color("error", bundle: .current)
    static let primaryBlue = Color("primaryBlue", bundle: .current)
    static let progressFill = Color("progressFill", bundle: .current)
    static let surface = Color("surface", bundle: .current)
    static let textPrimary = Color("textPrimary", bundle: .current)
    static let textSecondary = Color("textSecondary", bundle: .current)
}

extension Bundle {
    static var current: Bundle {
        class __ {}
        return Bundle(for: __.self)
    }
}

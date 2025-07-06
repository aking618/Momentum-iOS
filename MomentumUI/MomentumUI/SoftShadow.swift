//
//  SoftShadow.swift
//  MomentumUI
//
//  Created by Ayren King on 7/6/25.
//

import SwiftUI

struct SoftShadow: ViewModifier {
    var radius: CGFloat
    var color: Color?

    private var shadowColor: Color {
        color ?? .border
    }

    init(radius: CGFloat = 12, color: Color? = nil) {
        self.radius = radius
        self.color = color
    }
    
    func body(content: Content) -> some View {
        content
            .shadow(color: shadowColor, radius: radius, x: 2, y: 6)
    }
}

extension View {
    public func softShadow(radius: CGFloat = 12, color: Color? = nil) -> some View {
        modifier(SoftShadow(radius: radius, color: color))
    }
}

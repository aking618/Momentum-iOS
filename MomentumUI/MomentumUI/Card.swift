//
//  Card.swift
//  MomentumUI
//
//  Created by Ayren King on 7/6/25.
//

import SwiftUI

public struct Card<Content: View>: View {
    public var content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        content
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.surface)
                    .stroke(Color.border)
                    .softShadow(radius: 12, color: .background)

            )
    }
}

#Preview {
    Card {
        Text("Hello, World!")
    }
}

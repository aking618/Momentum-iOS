//
//  ProgressRing.swift
//  MomentumUI
//
//  Created by Ayren King on 7/9/25.
//

import SwiftUI

public struct ProgressRing: View {
    let progress: CGFloat // 0 to 1

    public init(progress: CGFloat) {
        self.progress = progress
    }

    public var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 6)
                .foregroundColor(Color.border)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.progressFill, style: StrokeStyle(lineWidth: 6, lineCap: .round))
                .rotationEffect(.degrees(-90))
            Text("\(Int(progress * 100))%")
                .font(.subheadline)
                .bold()
                .foregroundStyle(Color.textPrimary)
        }
        .frame(width: 72, height: 72)
    }
}

#Preview {
    ProgressRing(progress: 0.33)

    Color.clear.frame(height: 50)

    Card {
        ProgressRing(progress: 0.33)
    }
}

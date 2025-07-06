//
//  Podium.swift
//  MomentumUI
//
//  Created by Ayren King on 7/6/25.
//

import SwiftUI

public struct Podium<First: View, Second: View, Third: View>: View {
    public let first: First
    public let second: Second
    public let third: Third

    @State private var appeared = false

    public init(
        @ViewBuilder first: () -> First,
        @ViewBuilder second: () -> Second,
        @ViewBuilder third: () -> Third
    ) {
        self.first = first()
        self.second = second()
        self.third = third()
    }

    public var body: some View {
        GeometryReader { proxy in
            let screenWidth = proxy.size.width
            let screenHeight = proxy.size.height
            let columnWidth = screenWidth / 6
            let spacing = screenWidth / 12

            let heights: [CGFloat] = [
                screenHeight * 0.3, // third
                screenHeight * 0.5, // first
                screenHeight * 0.4  // second
            ]

            HStack(alignment: .bottom, spacing: spacing) {
                podiumColumn(
                    title: "🥉",
                    content: third,
                    height: heights[0],
                    width: columnWidth,
                    color: .brown,
                    delay: 0.1
                )

                podiumColumn(
                    title: "🥇",
                    content: first,
                    height: heights[1],
                    width: columnWidth,
                    color: .yellow,
                    delay: 0.3
                )

                podiumColumn(
                    title: "🥈",
                    content: second,
                    height: heights[2],
                    width: columnWidth,
                    color: .gray,
                    delay: 0.2
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                appeared = true
            }
        }
        .padding(.horizontal)
    }

    private func podiumColumn<Content: View>(
        title: String,
        content: Content,
        height: CGFloat,
        width: CGFloat,
        color: Color,
        delay: Double
    ) -> some View {
        VStack(spacing: 8) {
            Group {
                Text(title)
                    .font(.largeTitle)

                content
                    .font(.headline)
            }
            .opacity(appeared ? 1 : 0)
            .animation(.easeInOut(duration: 0.4).delay(delay), value: appeared)

            RoundedRectangle(cornerRadius: 16)
                .fill(color.gradient)
                .frame(width: width, height: appeared ? height : 0)
                .shadow(color: color.opacity(0.3), radius: 10, y: 5)
                .animation(.spring(response: 0.6, dampingFraction: 0.7).delay(delay), value: appeared)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

#Preview {
    @Previewable @State var reset = false
    VStack(spacing: 20) {
        Text("Podium Results")
            .font(.title.bold())

        Button("reset") { reset.toggle() }

        Spacer()

        if reset {
            Podium(
                first: {
                    Text("Alice")
                },
                second: {
                    Text("Bob")
                },
                third: {
                    Text("Charlie")
                }
            )
        }
    }
    .padding()
}

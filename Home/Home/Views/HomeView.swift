//
//  HomeView.swift
//  Home
//
//  Created by Ayren King on 7/9/25.
//

import ComposableArchitecture
import MomentumUI
import SwiftUI

public struct HomeView: View {
    let store: StoreOf<HomeFeature>

    let mockStats = [
        ("Total Distance", "142 mi"),
        ("Total Races", "18"),
        ("Fastest 5K", "21:42")
    ]

    let mockBadges = [
        ("5K PR", "🏅"),
        ("10 Events", "🎉"),
        ("2025 Goal", "📅")
    ]

    let upcomingEvents = [
        EventTile(title: "OKC River Run", type: "5K", date: .now.addingTimeInterval(86400 * 3), location: "Oklahoma City", tileType: .upcoming),
        EventTile(title: "Trail Dash", type: "10K", date: .now.addingTimeInterval(86400 * 7), tileType: .upcoming)
    ]

    let finishedEvents = [
        EventTile(title: "Tulsa Sprint Triathlon", type: "Triathlon", date: .now.addingTimeInterval(-86400 * 10), location: "Tulsa, OK", finishTime: "1:22:45", tileType: .finished),
        EventTile(title: "Lake Run 10K", type: "10K", date: .now.addingTimeInterval(-86400 * 30), tileType: .finished)
    ]

    public init(store: StoreOf<HomeFeature>) {
        self.store = store
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                // Greeting
                VStack(alignment: .leading, spacing: 4) {
                    Text("Hi Ayren 👋")
                        .font(.title2).bold()
                        .foregroundStyle(Color.textPrimary)
                    Text("Here’s your current progress")
                        .font(.subheadline)
                        .foregroundStyle(Color.textSecondary)
                }
                .padding(.horizontal)

                // Stat Tiles
                HStack(spacing: 12) {
                    ForEach(mockStats, id: \.0) { stat in
                        StatTile(title: stat.0, value: stat.1)
                    }
                }
                .padding(.horizontal)

                Card {
                    HStack(spacing: 16) {
                        ProgressRing(progress: 0.63)
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Yearly Goal")
                                .font(.caption)
                                .foregroundStyle(Color.textSecondary)
                            Text("63% complete")
                                .font(.headline)
                                .foregroundStyle(Color.textPrimary)
                            Text("63 of 100 miles")
                                .font(.subheadline)
                                .foregroundStyle(Color.textSecondary)
                        }
                    }
                }
                .padding(.horizontal)

                Card {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Recent Badges")
                            .font(.headline)
                            .foregroundStyle(Color.textPrimary)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(mockBadges, id: \.0) { badge in
                                    BadgeView(label: badge.0, icon: badge.1)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Upcoming Events")
                        .font(.headline)
                        .foregroundStyle(Color.textPrimary)
                        .padding(.horizontal)

                    VStack(spacing: 12) {
                        ForEach(0..<upcomingEvents.count, id: \.self) { index in
                            Card {
                                upcomingEvents[index]
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                // Finished Events
                VStack(alignment: .leading, spacing: 12) {
                    Text("Finished Events")
                        .font(.headline)
                        .foregroundStyle(Color.textPrimary)
                        .padding(.horizontal)

                    VStack(spacing: 12) {
                        ForEach(0..<finishedEvents.count, id: \.self) { index in
                            Card {
                                finishedEvents[index]
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
        .background(Color.background.ignoresSafeArea())
    }
}


#Preview {
    HomeView(store: Store(initialState: HomeFeature.State(), reducer: {
        HomeFeature()
    }))
}

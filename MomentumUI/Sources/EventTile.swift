//
//  EventTile.swift
//  MomentumUI
//
//  Created by Ayren King on 7/10/25.
//

import SwiftUI

public struct EventTile: View {
    public enum TileType {
        case upcoming
        case finished
    }

    let title: String
    let type: String
    let date: Date
    let location: String?
    let finishTime: String?
    let tileType: TileType

    public init(title: String, type: String, date: Date, location: String? = nil, finishTime: String? = nil, tileType: TileType) {
        self.title = title
        self.type = type
        self.date = date
        self.location = location
        self.finishTime = finishTime
        self.tileType = tileType
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                        .foregroundStyle(Color.textPrimary)
                    Text(type)
                        .font(.caption)
                        .foregroundStyle(Color.textSecondary)
                    Text(date.formatted(date: .abbreviated, time: .omitted))
                        .font(.caption)
                        .foregroundStyle(Color.textSecondary)
                    if let location {
                        Text(location)
                            .font(.caption)
                            .foregroundStyle(Color.textSecondary)
                    }
                }
                Spacer()
                if tileType == .finished {
                    if let finishTime {
                        Text(finishTime)
                            .font(.headline)
                            .foregroundStyle(Color.accentGreen)
                    } else {
                        Text("Add time")
                            .font(.caption)
                            .foregroundStyle(Color.primaryBlue)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Capsule().fill(Color.primaryBlue.opacity(0.1)))
                    }
                }
            }
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        Card {
            EventTile(
                title: "OKC River Run",
                type: "5K",
                date: .now.addingTimeInterval(86400 * 3),
                location: "Oklahoma City",
                tileType: .upcoming
            )
        }

        Card {
            EventTile(
                title: "Tulsa Sprint Triathlon",
                type: "Triathlon",
                date: .now.addingTimeInterval(-86400 * 10),
                location: "Tulsa, OK",
                finishTime: "1:22:45",
                tileType: .finished
            )
        }

        Card {
            EventTile(
                title: "Lake Run 10K",
                type: "10K",
                date: .now.addingTimeInterval(-86400 * 30),
                tileType: .finished
            )
        }
    }
    .padding()
    .background(Color.background)
} 

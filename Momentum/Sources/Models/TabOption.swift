//
//  TabOption.swift
//  Momentum
//
//  Created by Ayren King on 12/28/24.
//

import SwiftUI

enum TabOption: Hashable, CaseIterable {
    case home
    case races
    case podium
    case data
    case profile

    var title: String {
        switch self {
        case .home: "Home"
        case .races: "Races"
        case .podium: "Podium"
        case .data: "Data"
        case .profile: "Account"
        }
    }

    var image: String {
        switch self {
        case .home: "house"
        case .races: "flag.pattern.checkered.2.crossed"
        case .podium: "trophy"
        case .data: "chart.xyaxis.line"
        case .profile: "person.fill"
        }
    }
}

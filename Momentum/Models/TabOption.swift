//
//  TabOption.swift
//  Momentum
//
//  Created by Ayren King on 12/28/24.
//

import SwiftUI

enum TabOption: Hashable, CaseIterable {
    case races
    case podium
    case data
    case account

    var title: String {
        switch self {
        case .races: "Races"
        case .podium: "Podium"
        case .data: "Data"
        case .account: "Account"
        }
    }

    var image: String {
        switch self {
        case .races: "flag.pattern.checkered.2.crossed"
        case .podium: "trophy"
        case .data: "chart.xyaxis.line"
        case .account: "person.fill"
        }
    }
}

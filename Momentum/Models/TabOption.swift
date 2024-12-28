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

    var title: String {
        switch self {
        case .races: "Races"
        case .podium: "Podium"
        }
    }

    var image: String {
        switch self {
        case .races: "flag.pattern.checkered.2.crossed"
        case .podium: "trophy"
        }
    }
}

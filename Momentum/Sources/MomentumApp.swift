//
//  MomentumApp.swift
//  Momentum
//
//  Created by Ayren King on 12/27/24.
//

import ComposableArchitecture
import Database
import SwiftData
import SwiftUI

@main
struct MomentumApp: App {

    @MainActor
    static let store = Store(initialState: AppFeature.State()) {
        AppFeature()
    }

    var body: some Scene {
        WindowGroup {
            if isTesting {
                EmptyView()
            } else {
                AppView(store: Self.store)
            }
        }
    }
}

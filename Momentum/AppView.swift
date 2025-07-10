//
//  AppView.swift
//  Momentum
//
//  Created by Ayren King on 12/27/24.
//

import ComposableArchitecture
import Events
import Home
import SwiftUI

struct AppView: View {
    @Bindable var store: StoreOf<AppFeature>

    var body: some View {
        TabView {
            Tab(TabOption.home.title, systemImage: TabOption.home.image) {
                HomeView(store: store.scope(state: \.home, action: \.home))
            }

            Tab(TabOption.races.title, systemImage: TabOption.races.image) {
                EventsView(store: store.scope(state: \.events, action: \.events))
            }

            Tab(TabOption.podium.title, systemImage: TabOption.podium.image) {
                Text(TabOption.podium.title)
            }

            Tab(TabOption.data.title, systemImage: TabOption.data.image) {
                Text(TabOption.data.title)
            }

            Tab(TabOption.account.title, systemImage: TabOption.account.image) {
                Text(TabOption.account.title)
            }
        }
    }
}

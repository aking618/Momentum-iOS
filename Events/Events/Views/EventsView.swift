//
//  EventsView.swift
//  Events
//
//  Created by Ayren King on 12/30/24.
//

import ComposableArchitecture
import SwiftUI

public struct EventsView: View {
    @Bindable var store: StoreOf<EventsFeature>

    public init(store: StoreOf<EventsFeature>) {
        self.store = store
    }

    public var body: some View {
        Text("Events")
    }
}

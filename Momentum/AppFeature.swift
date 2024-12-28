//
//  AppFeature.swift
//  Momentum
//
//  Created by Ayren King on 12/27/24.
//

import ComposableArchitecture
import Events

@Reducer
struct AppFeature {
    @ObservableState
    struct State: Equatable {
        var selectedTab: TabOption = .races

        // Child Features
        var events = EventsFeature.State()
    }

    enum Action: ViewAction, Equatable {
        case events(EventsFeature.Action)
        case view(View)
    }

    enum View: BindableAction, Equatable {
        case binding(BindingAction<State>)
    }

    var body: some ReducerOf<Self> {
        BindingReducer(action: \.view)

        Scope(state: \.events, action: \.events) {
            EventsFeature()
        }

        Reduce { state, action in
            switch action {
            // Event Actions
            case .events:
                return .none

            // View Actions
            case .view:
                return .none
            }
        }
    }
}

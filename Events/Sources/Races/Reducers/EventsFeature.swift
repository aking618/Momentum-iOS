//
//  EventsFeature.swift
//  Races
//
//  Created by Ayren King on 12/28/24.
//

import ComposableArchitecture

@Reducer
public struct EventsFeature {
    @ObservableState
    public struct State: Equatable {
        public init() {}
    }

    public enum Action: Equatable {}

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
}

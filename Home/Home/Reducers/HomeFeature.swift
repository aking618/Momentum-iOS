//
//  HomeFeature.swift
//  Home
//
//  Created by Ayren King on 7/9/25.
//

import ComposableArchitecture

@Reducer
public struct HomeFeature {
    public init() {}

    @ObservableState
    public struct State: Equatable {
        public init() {}
    }

    public enum Action: Equatable {}

    public var body: some ReducerOf<Self> {
        Reduce { _, _ in
            return .none
        }
    }
}

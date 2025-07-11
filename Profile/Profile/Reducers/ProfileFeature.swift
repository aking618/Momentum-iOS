//
//  Profile.swift
//  Profile
//
//  Created by Ayren King on 7/10/25.
//

import ComposableArchitecture

@Reducer
public struct ProfileFeature {
    public init() {}

    @ObservableState
    public struct State: Equatable {
        public init() {}
    }

    public enum Action: Equatable {}

    public var body: some ReducerOf<Self> {
        Reduce { _, _ in return .none }
    }
}

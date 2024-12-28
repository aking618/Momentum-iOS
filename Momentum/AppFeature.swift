//
//  AppFeature.swift
//  Momentum
//
//  Created by Ayren King on 12/27/24.
//

import ComposableArchitecture

@Reducer
struct AppFeature {
    @ObservableState
    struct State: Equatable {}

    enum Action: Equatable {}

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
}

//
//  AppView.swift
//  Momentum
//
//  Created by Ayren King on 12/27/24.
//

import ComposableArchitecture
import SwiftUI

struct AppView: View {
    @Bindable var store: StoreOf<AppFeature>

    var body: some View {
        Text("Hello, World")
    }
}

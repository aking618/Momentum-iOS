//
//  ProfileView.swift
//  Profile
//
//  Created by Ayren King on 7/10/25.
//

import ComposableArchitecture
import MomentumUI
import SwiftUI

public struct ProfileView: View {
    let store: StoreOf<ProfileFeature>

    let name = "Ayren King"
    let email = "ayren@example.com"
    let appVersion = "1.0.3"

    public init(store: StoreOf<ProfileFeature>) {
        self.store = store
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header
                VStack(alignment: .leading, spacing: 4) {
                    Text("Profile")
                        .font(.largeTitle).bold()
                        .foregroundStyle(Color.textPrimary)
                    Text("Manage your account and preferences")
                        .font(.subheadline)
                        .foregroundStyle(Color.textSecondary)
                }
                .padding(.horizontal)

                // Account Info
                VStack(alignment: .leading, spacing: 12) {
                    Text("Account Info")
                        .font(.headline)
                        .foregroundStyle(Color.textPrimary)
                    Card {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(name)
                                .font(.body)
                                .foregroundStyle(Color.textPrimary)
                            Text(email)
                                .font(.subheadline)
                                .foregroundStyle(Color.textSecondary)
                        }
                    }
                }
                .padding(.horizontal)

                // Actions
                VStack(alignment: .leading, spacing: 12) {
                    Text("Quick Actions")
                        .font(.headline)
                        .foregroundStyle(Color.textPrimary)
                    VStack(spacing: 12) {
                        Card {
                            HStack {
                                Text("Edit Goals")
                                    .font(.subheadline)
                                    .foregroundStyle(Color.textPrimary)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.textSecondary)
                            }
                            .padding(.vertical, 4)
                        }

                        Card {
                            HStack {
                                Text("Customize Home Stats")
                                    .font(.subheadline)
                                    .foregroundStyle(Color.textPrimary)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.textSecondary)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
                .padding(.horizontal)

                Spacer(minLength: 32)

                // App Version
                Text("Version \(appVersion)")
                    .font(.footnote)
                    .foregroundStyle(Color.textSecondary)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(.vertical)
        }
        .background(Color.background.ignoresSafeArea())
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Edit") {
                    // Edit profile action
                }
            }
        }
    }
}

#Preview {
    ProfileView(store: Store(initialState: ProfileFeature.State(), reducer: {
        ProfileFeature()
    }))
}

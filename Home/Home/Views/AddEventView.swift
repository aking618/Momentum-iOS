//
//  AddEventView.swift
//  Home
//
//  Created by Ayren King on 7/10/25.
//

import MomentumUI
import SwiftUI

public struct AddEventView: View {
    @State private var title: String = ""
    @State private var type: String = ""
    @State private var date: Date = Date()
    @State private var location: String = ""

    @FocusState private var isFocused: Bool

    public init() {}

    public var body: some View {
        List {
            Card {
                VStack(spacing: 16) {
                    TextField("Event Name", text: $title)
                        .textFieldStyle(OutlinedTextFieldStyle(label: "Name", isFocused: false))
                        .listRowSeparator(.hidden)

                    TextField("Event Type (e.g., 5K, Triathlon)", text: $type)
                        .textFieldStyle(OutlinedTextFieldStyle(label: "Type", isFocused: false))
                        .listRowSeparator(.hidden)
                }
            }
            Card {
                DatePicker("Date", selection: $date, displayedComponents: .date)
                    .foregroundStyle(Color.textPrimary)

                TextField("Location (optional)", text: $location)
                    .textFieldStyle(OutlinedTextFieldStyle(label: "Location", isFocused: false))
            }

            Section {
                Button(action: saveEvent) {
                    Text("Save Event")
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .buttonStyle(.primary)
            }
        }
        .listStyle(.plain)
        .padding(.horizontal)
        .scrollContentBackground(.hidden)
        .background(Color.background)
        .navigationTitle("Add Event")
    }

    private func saveEvent() {
        // Save logic here
    }
}

#Preview {
    NavigationStack {
        AddEventView()
    }
}

//
//  TextInput.swift
//  MomentumUI
//
//  Created by Ayren King on 7/6/25.
//

import SwiftUI

public struct OutlinedTextFieldStyle: TextFieldStyle {
    private var label: String?
    private var isFocused: Bool

    public init(label: String? = nil, isFocused: Bool) {
        self.label = label
        self.isFocused = isFocused
    }

    public func _body(configuration: TextField<Self._Label>) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            if let label {
                Text(label)
                    .foregroundStyle(.textPrimary)
                    .font(.system(size: 13, weight: .medium))
            }
            configuration
                .font(.system(size: 17))
                .padding(.vertical, 8)
                .background(alignment: .bottom) {
                    Divider()
                        .overlay(isFocused ? .primaryBlue : Color.gray.opacity(0.2))
                }
        }
    }
}

extension TextFieldStyle where Self == OutlinedTextFieldStyle {
    public static func outlined(label: String? = nil, isFocused: Bool) -> OutlinedTextFieldStyle {
        .init(label: label, isFocused: isFocused)
    }
}

extension TextField where Label == EmptyView {
    nonisolated public init(_ binding: Binding<String>, prompt: Text? = nil) {
        self = TextField(text: binding, prompt: prompt, label: { EmptyView() })
    }
}

#Preview {
    @Previewable @State var text = ""
    @FocusState var focus: Bool
    ZStack {
        Color.background
        TextField($text, prompt: Text("test"))
            .textFieldStyle(.outlined(label: "Label", isFocused: focus == true))
            .focused($focus, equals: true)
            .padding()
    }
}

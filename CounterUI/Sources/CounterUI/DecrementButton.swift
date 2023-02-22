//
//  DecrementButton.swift
//
//
//  Created by Matt Bonney on 2/22/23.
//

import SwiftUI
import CounterCore

public struct DecrementButton: View {
    @EnvironmentObject private var counter: Counter
    public let value: Int

    public init(value: Int = 1) {
        self.value = value
    }

    public var body: some View {
        Button {
            counter.decrement(by: value)
        } label: {
            label()
                .font(.system(.title, design: .rounded, weight: .bold))
                .frame(minHeight: 38)
                .frame(maxWidth: .infinity)
        }
        .controlSize(.large)
        .buttonStyle(.borderedProminent)
        .tint(.accentColor)
    }

    @ViewBuilder func label() -> some View {
        if value == 1 {
            Image(systemName: "minus")
        } else {
            Label {
                Text(value, format: .number)
            } icon: {
                Image(systemName: "minus")
            }
        }
    }
}

struct DecrementButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            DecrementButton(value: 1)
            DecrementButton(value: 2)
        }
        .environmentObject(Counter())
        .padding()
    }
}

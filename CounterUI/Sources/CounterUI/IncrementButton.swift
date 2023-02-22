//
//  IncrementButton.swift
//  
//
//  Created by Matt Bonney on 2/22/23.
//

import SwiftUI
import CounterCore

public struct IncrementButton: View {
    @EnvironmentObject private var counter: Counter
    public let value: Int

    public init(value: Int = 1) {
        self.value = value
    }

    public var body: some View {
        Button {
            counter.increment(by: value)
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
            Image(systemName: "plus")
        } else {
            Label {
                Text(value, format: .number)
            } icon: {
                Image(systemName: "plus")
            }
        }
    }
}

struct IncrementButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            IncrementButton(value: 1)
            IncrementButton(value: 4)
        }
        .environmentObject(Counter())
        .padding()
    }
}

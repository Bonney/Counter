//
//  CurrentCount.swift
//
//
//  Created by Matt Bonney on 2/22/23.
//

import SwiftUI
import CounterCore

public struct CurrentCount: View {
    @EnvironmentObject private var counter: Counter

    public init() {
    }

    public var body: some View {
        Text(counter.count, format: .number)
    }
}

struct CurrentCount_Previews: PreviewProvider {
    static var previews: some View {
        CurrentCount()
            .environmentObject(Counter())
    }
}

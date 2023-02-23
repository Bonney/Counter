//
//  CurrentCount.swift
//
//
//  Created by Matt Bonney on 2/22/23.
//

import SwiftUI
import CounterCore

public struct CurrentCount: View {
    @AppStorage("count", store: UserDefaults(suiteName: "group.io.bonney.counter")) public var count = 0

    public init() {
    }

    public var body: some View {
        Text(count, format: .number)
    }
}

struct CurrentCount_Previews: PreviewProvider {
    static var previews: some View {
        CurrentCount()
    }
}

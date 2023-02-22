//
//  Counter.swift
//  
//
//  Created by Matt Bonney on 2/22/23.
//

import SwiftUI

public class Counter: ObservableObject {
    @AppStorage("count", store: UserDefaults(suiteName: "group.io.bonney.counter")) public var count = 0

    private var initialCount: Int = 0

    public init(initialCount: Int = 0) {
        self.initialCount = initialCount
        self.count = initialCount
    }

    public func increment(by x: Int = 1) {
        count += x
    }

    public func decrement(by x: Int = 1) {
        count -= x
    }

    public func reset() {
        count = initialCount
    }

    public func set(to x: Int) {
        count = x
    }
}
